import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    required this.body,
    super.key,
    this.appBar,
    this.backgroundColor,
    this.safeArea = true,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool safeArea;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: safeArea ? SafeArea(child: body) : body,
      ),
    );
  }
}
