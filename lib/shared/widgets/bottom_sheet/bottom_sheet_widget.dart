import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryPress;
  final String secondaryLabel;
  final VoidCallback secondaryPress;
  final String title;
  final String subtitle;
  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryPress,
    required this.secondaryLabel,
    required this.secondaryPress,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text.rich(
                    TextSpan(
                      text: title,
                      style: AppTextStyles.buttonBoldHeading,
                      children: [
                        TextSpan(
                          text: '\n$subtitle',
                          style: AppTextStyles.buttonHeading,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: AppColors.stroke,
                  thickness: 1,
                  height: 0,
                ),
                SetLabelButtons(
                  primaryLabel: primaryLabel,
                  primaryPress: primaryPress,
                  secondaryLabel: secondaryLabel,
                  secondaryPress: secondaryPress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
