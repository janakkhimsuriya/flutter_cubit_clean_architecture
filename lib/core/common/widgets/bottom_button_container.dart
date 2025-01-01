import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButtonContainerWidget extends StatelessWidget {
  const BottomButtonContainerWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.r, 20.r, 30.r, 30.r),
      child: child,
    );
  }
}
