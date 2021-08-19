import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final Color? primary;
  const LabelButton({
    Key? key,
    required this.label,
    required this.press,
    this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: press,
        child: Text(
          label,
          style: AppTextStyles.buttonHeading.copyWith(color: primary),
        ),
      ),
    );
  }
}
