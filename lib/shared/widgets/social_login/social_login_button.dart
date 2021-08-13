import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback press;
  const SocialLoginButton({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          border: Border.fromBorderSide(BorderSide(color: AppColors.stroke)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(AppImages.google),
            ),
            Container(height: 56, width: 1, color: AppColors.stroke),
            const Spacer(),
            Text(
              'Entrar com Google',
              style: AppTextStyles.buttonGray,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
