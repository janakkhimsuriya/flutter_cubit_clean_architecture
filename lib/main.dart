import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  di();
  runApp(App());
}
