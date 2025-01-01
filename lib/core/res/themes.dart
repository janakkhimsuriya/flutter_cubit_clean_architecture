import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: cBackground,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  );
}
