import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton(
      {super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: SizedBox(
        width: 296,
        height: 56,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.mainBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(232, 56), // Width and height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Border radius
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.textButtonStyle,
          ),
        ),
      ),
    );
  }
}
