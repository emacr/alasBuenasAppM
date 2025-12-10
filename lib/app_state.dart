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
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
    });
    _safeInit(() {
      _userRol = prefs.getString('ff_userRol') ?? _userRol;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userInfojson')) {
        try {
          _userInfojson = jsonDecode(prefs.getString('ff_userInfojson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
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

  /// token del login
  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
  }

  /// el rol del usuario del login
  String _userRol = '';
  String get userRol => _userRol;
  set userRol(String value) {
    _userRol = value;
    prefs.setString('ff_userRol', value);
  }

  /// nombre del usuario del login
  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  /// info completa del user del login
  dynamic _userInfojson;
  dynamic get userInfojson => _userInfojson;
  set userInfojson(dynamic value) {
    _userInfojson = value;
    prefs.setString('ff_userInfojson', jsonEncode(value));
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
