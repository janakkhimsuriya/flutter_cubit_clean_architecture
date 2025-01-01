import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


enum ButtonSize { small, medium, large }

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
        return 25.r;
      case ButtonSize.medium:
        return 30.r;
      case ButtonSize.large:
        return 40.r;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 8.sp;
      case ButtonSize.medium:
        return 10.sp;
      case ButtonSize.large:
        return 12.sp;
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
          textStyle: context.textStyles.text8P12TText.copyWith(
            fontSize: _getFontSize(),
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          alignment: Alignment.centerLeft,
          backgroundColor: cBrightAquamarine,
          foregroundColor: Colors.white,
          disabledBackgroundColor: cGrayDark,
          disabledForegroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: size == ButtonSize.large ? 16.r : 10.r,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              size == ButtonSize.large ? 10.r : 8.r,
            ),
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
                  strokeWidth: size == ButtonSize.large
                      ? 3.r
                      : size == ButtonSize.medium
                          ? 2.r
                          : 1.r,
                  color: Colors.white,
                ),
              ),
            if (state == ButtonState.loading)
              SizedBox(width: size == ButtonSize.large ? 16.r : 10.r),
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
            /*CustomButton(
              label: context.strings.btnLogin,
              size: ButtonSize.small,
              onPressed: () {},
            ),
            const SizedBox(width: 20),*/
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
        const SizedBox(height: 20),
        Row(
          children: [
            /* CustomButton(
              label: context.strings.btnLogin,
              onPressed: () {},
            ),
            const SizedBox(width: 20),*/
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
        const SizedBox(height: 20),
        Row(
          children: [
            /*CustomButton(
              label: context.strings.btnLogin,
              size: ButtonSize.large,
              onPressed: () {},
            ),
            const SizedBox(width: 20),*/
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.large,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.large,
                state: ButtonState.disable,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                label: context.strings.login,
                size: ButtonSize.large,
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
