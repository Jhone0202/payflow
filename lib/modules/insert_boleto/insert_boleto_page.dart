import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/Input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertBoletoPage extends StatefulWidget {
  static const String routeName = '/insert_boleto_page';
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Preencha os dados do boleto',
                    style: AppTextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                InputTextWidget(
                  label: 'Nome do boleto',
                  icon: Icons.description_outlined,
                  onChanged: (String value) {
                    controller.onChange(name: value);
                  },
                  validator: controller.validadeName,
                ),
                InputTextWidget(
                  label: 'Vencimento',
                  controller: dueDateInputTextController,
                  icon: FontAwesomeIcons.calendar,
                  onChanged: (String value) {
                    controller.onChange(dueDate: value);
                  },
                  validator: controller.validadeVencimento,
                ),
                InputTextWidget(
                  label: 'Valor',
                  controller: moneyInputTextController,
                  icon: FontAwesomeIcons.wallet,
                  onChanged: (String value) {
                    controller.onChange(
                      value: moneyInputTextController.numberValue,
                    );
                  },
                  validator: (_) => controller
                      .validadeValor(moneyInputTextController.numberValue),
                ),
                InputTextWidget(
                  label: 'Código',
                  controller: barcodeInputTextController,
                  icon: FontAwesomeIcons.barcode,
                  onChanged: (String value) {
                    controller.onChange(cod: value);
                  },
                  validator: controller.validadeCodigo,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryPress: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryPress: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecColor: true,
      ),
    );
  }
}
