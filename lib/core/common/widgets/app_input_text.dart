import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    required this.controller,
    required this.hintText,
    super.key,
    this.isEnabled = true,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isEnabled;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      enabled: isEnabled,
      maxLength: 48,
      textCapitalization: textCapitalization,
      cursorHeight: 16.r,
      style: context.textStyles.text18P20TText.copyWith(
        fontWeight: FontWeight.w500,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: cGrayLight,
        hintText: hintText,
        hintStyle: context.textStyles.text18P20TText.copyWith(
          fontWeight: FontWeight.w500,
          color: cTextColorLight,
        ),
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.r,
          vertical: 10.r,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: cBrightAquamarine),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
