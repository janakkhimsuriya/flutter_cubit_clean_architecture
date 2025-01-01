import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

extension BuildContextExt on BuildContext {
  Language get strings => sl<AppLocalization>().of(this);

  LocaleCubit get localeCubit => read<LocaleCubit>();

  AuthCubit get authCubit => read<AuthCubit>();

  TestStyles get textStyles => TestStyles.of(this);
}

extension ColorExt on Color {
  Color withAlphaA(int alpha) => withAlpha(alpha);
}
