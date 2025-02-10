import 'package:ai_sky/core/theming/colors.dart';
import 'package:ai_sky/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.leadingIcon, // New parameter for suffix icon
    this.iconSpacing, // Optional spacing between text and icon
    this.borderSide,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? leadingIcon; // Widget for the suffix icon
  final double? iconSpacing; // Optional spacing between text and icon
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 52),
        backgroundColor: backgroundColor ?? ColorsManager.mainBlue,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          side: borderSide ??
              BorderSide(
                color: Color(0xffDDDFDF),
                width: 1,
              ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0,
          vertical: verticalPadding ?? 0,
        ),
      ),
      onPressed: onPressed,
      child: ListTile(
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        leading: leadingIcon,
        title: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: textStyle ?? TextStyles.size16Weight700,
        ),
      ),
    );
  }
}
