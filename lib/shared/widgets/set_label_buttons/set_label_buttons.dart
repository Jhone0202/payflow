import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryPress;
  final String secondaryLabel;
  final VoidCallback secondaryPress;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryPress,
    required this.secondaryLabel,
    required this.secondaryPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              press: primaryPress,
              primary: AppColors.primary,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              press: secondaryPress,
            ),
          ),
        ],
      ),
    );
  }
}
