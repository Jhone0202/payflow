import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InsertBoletoPage extends StatelessWidget {
  static const String routeName = '/insert_boleto_page';
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: Text(
              'Preencha os dados do boleto',
              style: AppTextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
