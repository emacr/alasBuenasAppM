import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

bool? existePedidoEnLista(
  List<dynamic>? listaDePedidos,
  int? idBuscado,
) {
  // Revisa si la lista es nula o vacía
  if (listaDePedidos == null || listaDePedidos.isEmpty) {
    return false;
  }

  // Busca si algún elemento tiene el 'pedido_id' igual al buscado
  return listaDePedidos.any((pedido) => pedido['pedido_id'] == idBuscado);
}

String convertirJsonAString(dynamic valorJson) {
  return valorJson.toString();
}

String formatearListaSimple(dynamic entradaJson) {
  // 1. Si es nulo, devuelve vacío (adiós a la palabra "null")
  if (entradaJson == null) {
    return " "; // Un espacio vacío para que no se rompa el diseño
  }

  // 2. Si es una Lista (ej: ["Salsa", "Bebida"])
  if (entradaJson is List) {
    // Si está vacía [], devuelve vacío
    if (entradaJson.isEmpty) {
      return " ";
    }
    // Únelos con coma y espacio
    return entradaJson.map((e) => e.toString()).join(", ");
  }

  // 3. Si por error llega otra cosa, devuelve vacío
  return " ";
}

String? convertirSiNo(dynamic valorRaw) {
  if (valorRaw == null) return "No";

  // Convertimos a texto y minúsculas para asegurar que detecte "True", "true" o true
  String texto = valorRaw.toString().toLowerCase();

  if (texto == "true") {
    return "Sí";
  } else {
    return "No";
  }
}

String? obtenerSalsaBano(
  dynamic alasBanadas,
  dynamic nombreSalsa,
) {
  // 1. Verificar si están bañadas
  String isBathed = alasBanadas.toString().toLowerCase();

  // Si NO están bañadas ("false" o null), devolvemos vacío
  if (isBathed != "true") {
    return " "; // Espacio en blanco para ocultar el campo
  }

  // 2. Si SÍ están bañadas, verificamos que la salsa exista
  if (nombreSalsa == null || nombreSalsa.toString() == "null") {
    return "Salsa no especificada";
  }

  // 3. Devolvemos el nombre de la salsa limpia
  return nombreSalsa.toString();
}

int contarComandasActivas(List<dynamic>? listaPedidos) {
  // 1. Si la lista no existe o está vacía, hay 0 pedidos.
  if (listaPedidos == null || listaPedidos.isEmpty) {
    return 0;
  }

  int contador = 0;

  // 2. Recorremos cada pedido de la lista
  for (var pedido in listaPedidos) {
    // Obtenemos el estado (asegurándonos de que sea texto)
    String estado = pedido['estado_pedido']?.toString() ?? '';

    // 3. Verificamos si es uno de los estados que queremos contar
    if (estado == 'confirmado_sucursal' ||
        estado == 'eq.confirmado_sucursal' ||
        estado == 'en preparacion' ||
        estado == 'eq.en preparacion') {
      contador++;
    }
  }

  return contador;
}

String formatearFechaIso(String? fechaIso) {
  if (fechaIso == null || fechaIso.isEmpty) {
    return "Fecha no disponible";
  }

  try {
    // 1. Convertir el texto ISO a un objeto DateTime real
    DateTime fecha = DateTime.parse(fechaIso);

    // 2. Darle el formato bonito (Ej: 26 Nov 2025, 10:30 PM)
    // Puedes cambiar el patrón aquí si quieres otro estilo
    // 'dd/MM/yyyy HH:mm' -> 26/11/2025 22:30
    // 'MMM d, h:mm a' -> Nov 26, 10:30 PM
    return DateFormat('dd/MM/yyyy h:mm a').format(fecha);
  } catch (e) {
    return fechaIso; // Si falla, devuelve el original para no romper nada
  }
}

int conteoPedidosSupervisor(List<dynamic>? listaPedidos) {
// 1. Si la lista no existe o está vacía, hay 0 pedidos.
  if (listaPedidos == null || listaPedidos.isEmpty) {
    return 0;
  }

  int contador = 0;

  // 2. Recorremos cada pedido de la lista
  for (var pedido in listaPedidos) {
    // Obtenemos el estado (asegurándonos de que sea texto)
    String estado = pedido['estado_pedido']?.toString() ?? '';

    // 3. Verificamos si es uno de los estados que queremos contar
    if (estado == 'confirmado_sucursal' ||
        estado == 'eq.confirmado_sucursal' ||
        estado == 'en preparacion' ||
        estado == 'eq.en preparacion' ||
        estado == 'eq.listo_entrega' ||
        estado == 'listo_entrega' ||
        estado == 'eq.Servido en local' ||
        estado == 'Servido en local' ||
        estado == 'Entregado en local' ||
        estado == 'eq.Entregado en local' ||
        estado == 'en_camino' ||
        estado == 'eq.en_camino' ||
        estado == 'eq.Entregado' ||
        estado == 'Entregado') {
      contador++;
    }
  }

  return contador;
}

int contarComandasListas(List<dynamic>? listaPedidos) {
  // 1. Si la lista no existe o está vacía, hay 0 pedidos.
  if (listaPedidos == null || listaPedidos.isEmpty) {
    return 0;
  }

  int contador = 0;

  // 2. Recorremos cada pedido de la lista
  for (var pedido in listaPedidos) {
    // Obtenemos el estado (asegurándonos de que sea texto)
    String estado = pedido['estado_pedido']?.toString() ?? '';

    // 3. Verificamos si es uno de los estados que queremos contar
    if (estado == 'listo_entrega' || estado == 'eq.listo_entrega') {
      contador++;
    }
  }

  return contador;
}

int contarPedidosEntrega(List<dynamic>? listaPedidos) {
  if (listaPedidos == null || listaPedidos.isEmpty) {
    return 0;
  }

  int contador = 0;

  // 2. Recorremos cada pedido de la lista
  for (var pedido in listaPedidos) {
    // Obtenemos el estado (asegurándonos de que sea texto)
    String estado = pedido['estado_pedido']?.toString() ?? '';

    // 3. Verificamos si es uno de los estados que queremos contar
    if (estado == 'en_camino' || estado == 'eq.en_camino') {
      contador++;
    }
  }

  return contador;
}

int contarListaJson(dynamic lista) {
  // Si es nulo, 0
  if (lista == null) {
    return 0;
  }

  // Si es una lista real, devuelve su tamaño
  if (lista is List) {
    return lista.length;
  }

  // Si no es lista (ej: error o objeto vacio), 0
  return 0;
}

bool esEstadoConfirmadoSucursal(dynamic datoBd) {
  // 1. Si no hay dato, es falso
  if (datoBd == null) {
    return false;
  }

  // 2. Convertimos lo que llegue a texto y comparamos
  // El .toString() convierte el JSON a texto limpio
  return datoBd.toString() == 'confirmado_sucursal';
}

bool esEstadoPreparacionCocina(dynamic datoBd) {
  // 1. Si no hay dato, es falso
  if (datoBd == null) {
    return false;
  }

  // 2. Convertimos lo que llegue a texto y comparamos
  // El .toString() convierte el JSON a texto limpio
  return datoBd.toString() == 'en preparacion';
}
