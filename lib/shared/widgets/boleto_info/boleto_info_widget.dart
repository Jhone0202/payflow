import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.grey,
      ),
      child: Row(
        children: [
          Image.asset(
            AppImages.logomini,
            color: AppColors.background,
            width: 56,
            height: 34,
          ),
          Container(
            width: 1,
            height: 32,
            color: AppColors.background,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'Você tem ',
                style: AppTextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: '$size boletos\n',
                    style: AppTextStyles.captionBoldBackground,
                  ),
                  TextSpan(
                    text: 'cadastrados para pagar',
                    style: AppTextStyles.captionBackground,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
