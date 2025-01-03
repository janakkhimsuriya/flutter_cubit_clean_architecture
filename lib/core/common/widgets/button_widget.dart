import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonSize { small, medium }

enum ButtonState { enable, disable, loading }

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = ButtonSize.medium,
    this.state = ButtonState.enable,
    this.autoResize = true,
  });

  final String label;

  final VoidCallback? onPressed;
  final ButtonSize size;
  final ButtonState state;
  final bool autoResize;

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 35.r;
      case ButtonSize.medium:
        return 45.r;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 14.sp;
      case ButtonSize.medium:
        return 16.sp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      width: !autoResize ? double.infinity : null,
      child: ElevatedButton(
        onPressed: state == ButtonState.enable && state != ButtonState.loading
            ? onPressed
            : null,
        style: ElevatedButton.styleFrom(
          textStyle: context.textStyles.text8P10TText.copyWith(
            fontSize: _getFontSize(),
            color: Colors.white,
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
          alignment: Alignment.centerLeft,
          backgroundColor: cBrightAquamarine,
          foregroundColor: Colors.white,
          disabledBackgroundColor: cGrayDark,
          disabledForegroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state == ButtonState.loading)
              SizedBox(
                height: _getFontSize(),
                width: _getFontSize(),
                child: CircularProgressIndicator(
                  strokeWidth: size == ButtonSize.medium ? 3.r : 2.r,
                  color: Colors.white,
                ),
              ),
            if (state == ButtonState.loading) SizedBox(width: 16.r),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class ButtonTemplate extends StatelessWidget {
  const ButtonTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.small,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.small,
                state: ButtonState.disable,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.small,
                state: ButtonState.loading,
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                state: ButtonState.disable,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                state: ButtonState.loading,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
