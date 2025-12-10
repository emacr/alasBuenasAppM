import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_supervisor_model.dart';
export 'menu_supervisor_model.dart';

/// menu para el supervisor
class MenuSupervisorWidget extends StatefulWidget {
  const MenuSupervisorWidget({
    super.key,
    this.datosPedidoMenu,
  });

  final dynamic datosPedidoMenu;

  @override
  State<MenuSupervisorWidget> createState() => _MenuSupervisorWidgetState();
}

class _MenuSupervisorWidgetState extends State<MenuSupervisorWidget> {
  late MenuSupervisorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuSupervisorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 12.0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Ver Chat del Pedido',
              icon: Icon(
                Icons.wechat_outlined,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF0A719),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          if ((functions.convertirJsonAString(getJsonField(
                    widget.datosPedidoMenu,
                    r'''$.estado_pedido''',
                  )) ==
                  'confirmado_sucursal') ||
              (functions.convertirJsonAString(getJsonField(
                    widget.datosPedidoMenu,
                    r'''$.estado_pedido''',
                  )) ==
                  'en preparacion') ||
              (functions.convertirJsonAString(getJsonField(
                    widget.datosPedidoMenu,
                    r'''$.estado_pedido''',
                  )) ==
                  'listo_entrega'))
            FFButtonWidget(
              onPressed: () async {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Cancelar Pedido'),
                          content: Text(
                              '¿Estás seguro de que deseas cancelar este pedido? Esta acción no se puede deshacer'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  await UpdateEstadoPedidoCall.call(
                    idPedido: getJsonField(
                      widget.datosPedidoMenu,
                      r'''$.pedido_id''',
                    ),
                    nuevoEstadoId: 3,
                    token: FFAppState().authToken,
                  );

                  Navigator.pop(context);
                  context.safePop();
                } else {
                  Navigator.pop(context);
                }
              },
              text: 'Cancelar Pedido',
              icon: Icon(
                Icons.block_sharp,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFEF4C39),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
        ],
      ),
    );
  }
}
