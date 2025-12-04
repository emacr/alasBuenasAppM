import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pedidosEnPreparacion =
          prefs.getStringList('ff_pedidosEnPreparacion')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _pedidosEnPreparacion;
    });
    _safeInit(() {
      _pedidosListos = prefs.getStringList('ff_pedidosListos')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _pedidosListos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _pedidosEnPreparacion = [];
  List<dynamic> get pedidosEnPreparacion => _pedidosEnPreparacion;
  set pedidosEnPreparacion(List<dynamic> value) {
    _pedidosEnPreparacion = value;
    prefs.setStringList(
        'ff_pedidosEnPreparacion', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPedidosEnPreparacion(dynamic value) {
    pedidosEnPreparacion.add(value);
    prefs.setStringList('ff_pedidosEnPreparacion',
        _pedidosEnPreparacion.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPedidosEnPreparacion(dynamic value) {
    pedidosEnPreparacion.remove(value);
    prefs.setStringList('ff_pedidosEnPreparacion',
        _pedidosEnPreparacion.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPedidosEnPreparacion(int index) {
    pedidosEnPreparacion.removeAt(index);
    prefs.setStringList('ff_pedidosEnPreparacion',
        _pedidosEnPreparacion.map((x) => jsonEncode(x)).toList());
  }

  void updatePedidosEnPreparacionAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    pedidosEnPreparacion[index] = updateFn(_pedidosEnPreparacion[index]);
    prefs.setStringList('ff_pedidosEnPreparacion',
        _pedidosEnPreparacion.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPedidosEnPreparacion(int index, dynamic value) {
    pedidosEnPreparacion.insert(index, value);
    prefs.setStringList('ff_pedidosEnPreparacion',
        _pedidosEnPreparacion.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _pedidosListos = [];
  List<dynamic> get pedidosListos => _pedidosListos;
  set pedidosListos(List<dynamic> value) {
    _pedidosListos = value;
    prefs.setStringList(
        'ff_pedidosListos', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPedidosListos(dynamic value) {
    pedidosListos.add(value);
    prefs.setStringList(
        'ff_pedidosListos', _pedidosListos.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPedidosListos(dynamic value) {
    pedidosListos.remove(value);
    prefs.setStringList(
        'ff_pedidosListos', _pedidosListos.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPedidosListos(int index) {
    pedidosListos.removeAt(index);
    prefs.setStringList(
        'ff_pedidosListos', _pedidosListos.map((x) => jsonEncode(x)).toList());
  }

  void updatePedidosListosAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    pedidosListos[index] = updateFn(_pedidosListos[index]);
    prefs.setStringList(
        'ff_pedidosListos', _pedidosListos.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPedidosListos(int index, dynamic value) {
    pedidosListos.insert(index, value);
    prefs.setStringList(
        'ff_pedidosListos', _pedidosListos.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
