import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryPress;
  final String secondaryLabel;
  final VoidCallback secondaryPress;
  final bool enablePrimaryColor;
  final bool enableSecColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryPress,
    required this.secondaryLabel,
    required this.secondaryPress,
    this.enablePrimaryColor = false,
    this.enableSecColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: AppColors.background,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              press: primaryPress,
              primary: enablePrimaryColor ? AppColors.primary : AppColors.grey,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              press: secondaryPress,
              primary: enableSecColor ? AppColors.primary : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
