import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_cubit.freezed.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState.initial());

  Future<void> init() async {
    final locale = await sl<AppLocalization>().getAppLocale();
    await sl<AppLocalization>().setAppLocale(locale);
    emit(LocaleState.changed(locale));
  }

  Future<void> changeLocale() async {
    final locale = await sl<AppLocalization>().getAppLocale();

    if (locale.languageCode == AppLocalization.localeCodeEn) {
      await sl<AppLocalization>().setAppLocale(AppLocalization.localeEs);
      emit(const LocaleState.changed(AppLocalization.localeEs));
    } else {
      await sl<AppLocalization>().setAppLocale(AppLocalization.localeEn);
      emit(const LocaleState.changed(AppLocalization.localeEn));
    }
  }
}
