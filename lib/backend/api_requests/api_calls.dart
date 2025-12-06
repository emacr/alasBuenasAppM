import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OrderIncommingCall {
  static Future<ApiCallResponse> call({
    String? estado = 'eq.confirmado_sucursal',
    String? jwtToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiIDogImQ0NzgxOTUwLWM2OWItNGFlYi1hOTY4LTE3ZmUyMWZhY2FjZSIsICJlbWFpbCIgOiAidGVzdEBmbHV0dGVyZmxvdy5jb20iLCAicm9sZSIgOiAid2ViX3VzZXIiLCAiZXhwIiA6IDE3NjUwNDMwOTV9.71iXpByDzRFfkGWxkvw1uo6CaSNUv1QPUHG2VR-hOtk',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'orderIncomming',
      apiUrl:
          'https://postrest-dealercar-alas-buenas.kwu5pq.easypanel.host/vista_pedidos_movil',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiIDogImQ0NzgxOTUwLWM2OWItNGFlYi1hOTY4LTE3ZmUyMWZhY2FjZSIsICJlbWFpbCIgOiAidGVzdEBmbHV0dGVyZmxvdy5jb20iLCAicm9sZSIgOiAid2ViX3VzZXIiLCAiZXhwIiA6IDE3NjUwNDMwOTV9.71iXpByDzRFfkGWxkvw1uo6CaSNUv1QPUHG2VR-hOtk',
      },
      params: {
        'estado_pedido': "${estado}",
        'order': "fecha_pedido_confirmado.desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? orderId(dynamic response) => (getJsonField(
        response,
        r'''$[:].pedido_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? clientName(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombre_cliente''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? clientPhone(dynamic response) => (getJsonField(
        response,
        r'''$[:].telefono''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? storeName(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombre_sucursal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? orderStatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].estado_pedido''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? optionPayment(dynamic response) => (getJsonField(
        response,
        r'''$[:].forma_de_pago''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? optionPickUp(dynamic response) => (getJsonField(
        response,
        r'''$[:].tipo_retiro''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? comboName(dynamic response) => (getJsonField(
        response,
        r'''$[:].detalle_pedido[:].producto''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? deliveryCost(dynamic response) => (getJsonField(
        response,
        r'''$[:].costo_envio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? totalPay(dynamic response) => (getJsonField(
        response,
        r'''$[:].total_a_pagar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? extras(dynamic response) => (getJsonField(
        response,
        r'''$[:].detalle_pedido[:].opciones''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sauses(dynamic response) => (getJsonField(
        response,
        r'''$[:].detalle_pedido[:].salsa_banio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? alasBanadas(dynamic response) => (getJsonField(
        response,
        r'''$[:].detalle_pedido[:].alas_banadas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tipoAlitas(dynamic response) => (getJsonField(
        response,
        r'''$[:].detalle_pedido[:].tipo_alitas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateOrder(dynamic response) => (getJsonField(
        response,
        r'''$[:].fecha_creacion''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? pedidodetalles(dynamic response) => getJsonField(
        response,
        r'''$[:].detalle_pedido''',
        true,
      ) as List?;
  static List? pedidoCompleto(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class UpdateEstadoPedidoCall {
  static Future<ApiCallResponse> call({
    int? idPedido,
    int? nuevoEstadoId,
    int? repartidorId,
  }) async {
    final ffApiRequestBody = '''
{
  "estado_id": ${nuevoEstadoId},
  "repartidor_id": ${repartidorId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateEstadoPedido',
      apiUrl:
          'https://postrest-dealercar-alas-buenas.kwu5pq.easypanel.host/pedidos?id=eq.${idPedido}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiIDogImQ0NzgxOTUwLWM2OWItNGFlYi1hOTY4LTE3ZmUyMWZhY2FjZSIsICJlbWFpbCIgOiAidGVzdEBmbHV0dGVyZmxvdy5jb20iLCAicm9sZSIgOiAid2ViX3VzZXIiLCAiZXhwIiA6IDE3NjUwNDMwOTV9.71iXpByDzRFfkGWxkvw1uo6CaSNUv1QPUHG2VR-hOtk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRepartidoresCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRepartidores',
      apiUrl:
          'https://postrest-dealercar-alas-buenas.kwu5pq.easypanel.host/lista_repartidores_disponibles',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiIDogImQ0NzgxOTUwLWM2OWItNGFlYi1hOTY4LTE3ZmUyMWZhY2FjZSIsICJlbWFpbCIgOiAidGVzdEBmbHV0dGVyZmxvdy5jb20iLCAicm9sZSIgOiAid2ViX3VzZXIiLCAiZXhwIiA6IDE3NjUwNDMwOTV9.71iXpByDzRFfkGWxkvw1uo6CaSNUv1QPUHG2VR-hOtk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
