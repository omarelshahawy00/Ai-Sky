import 'package:ai_sky/core/theming/colors.dart';
import 'package:ai_sky/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius,
    this.borderSide,
    this.hintTextStyle,
    this.contentPadding,
    this.isObscureText,
    this.backgroundColor,
    this.suffixIcon,
    this.readOnly,
    this.fillColor,
    this.onSaved,
    this.prefixIcon,
    this.lableText,
  });

  final String? hintText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isObscureText;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final Color? fillColor;
  final String? Function(String?)? onSaved;

  final String? lableText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      readOnly: readOnly ?? false,
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: TextStyles.size13Weight600.copyWith(color: Colors.white),
        alignLabelWithHint: false,
        isDense: true,
        hintText: hintText,
        hintStyle: hintTextStyle ?? TextStyles.size13Weight600,
        fillColor: fillColor ?? ColorsManager.moreLightGray,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: borderSide ??
                  BorderSide(
                    color: backgroundColor ?? ColorsManager.mainBlue,
                    width: 1.3,
                  ),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: borderSide ??
                  BorderSide(
                    color: backgroundColor ?? ColorsManager.lightGray,
                    width: 1.3,
                  ),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
      ),
    );
  }
}
