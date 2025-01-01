import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class ContentHeaderText extends StatelessWidget {
  const ContentHeaderText({required this.text, this.color, super.key});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textStyles.text26P28TText.copyWith(
        color: color ?? cTextColorDark,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
