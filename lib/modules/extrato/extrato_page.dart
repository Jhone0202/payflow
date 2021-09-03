import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtratoPage extends StatefulWidget {
  const ExtratoPage({Key? key}) : super(key: key);

  @override
  _ExtratoPageState createState() => _ExtratoPageState();
}

class _ExtratoPageState extends State<ExtratoPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meu Extrato',
              style: AppTextStyles.titleBoldHeading,
            ),
            const SizedBox(height: 24),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            const SizedBox(height: 24),
            BoletoListWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}
