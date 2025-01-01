import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({required this.child, super.key, this.background});

  final Widget child;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
      decoration: BoxDecoration(
        color: background ?? cGrayExtraLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}

class ContainerWithTitleWidget extends StatelessWidget {
  const ContainerWithTitleWidget({
    required this.child,
    required this.title,
    super.key,
    this.background,
    this.textColor,
  });

  final Widget child;
  final String title;
  final Color? background;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textStyles.text14P18TText.copyWith(
            color: textColor ?? cGrayDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5.r),
        ContainerWidget(
          background: background,
          child: child,
        ),
      ],
    );
  }
}

class HighPriorityItem {
  HighPriorityItem({required this.priorityText, required this.number});

  final String priorityText;
  final int number;
}
