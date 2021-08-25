import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  static const String routeName = '/barcode_scanner';
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, InsertBoletoPage.routeName);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black.withOpacity(0.8),
                centerTitle: true,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTextStyles.buttonBackground,
                ),
                leading: BackButton(color: AppColors.background),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryPress: () {},
                secondaryLabel: 'Adicionar da galeria',
                secondaryPress: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: BottomSheetWidget(
                    labelPrimary: 'Escanear novamente',
                    onTapPrimary: () => controller.scanWithCamera(),
                    labelSecondary: 'Digitar código',
                    onTapSecondary: () {},
                    title: 'Não foi possível identificar um código de barras.',
                    subtitle:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
