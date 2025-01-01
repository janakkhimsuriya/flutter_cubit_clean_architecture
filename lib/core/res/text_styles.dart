import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestStyles {
  factory TestStyles.of(BuildContext context) {
    _instance ??= TestStyles._();
    _instance!._context = context;
    return _instance!;
  }

  TestStyles._();

  static TestStyles? _instance;
  late BuildContext _context;

  bool _isTablet() => ScreenUtil().deviceType(_context) == DeviceType.tablet;

  TextStyle get _textStyle =>
      const TextStyle(color: cTextColorDark, fontWeight: FontWeight.w400);

  TextStyle get text8P10TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 10 : 8);

  TextStyle get text10P12TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 12 : 10);

  TextStyle get text12P14TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 14 : 12);

  TextStyle get text14P16TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 16 : 14);

  TextStyle get text16P18TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 18 : 16);

  TextStyle get text18P20TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 20 : 18);

  TextStyle get text12P22TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 22 : 20);

  TextStyle get text22P24TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 24 : 22);

  TextStyle get text24P26TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 26 : 24);

  TextStyle get text26P28TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 28 : 26);

  TextStyle get text28P30TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 30 : 28);

  TextStyle get text30P32TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 32 : 30);

  TextStyle get text38P40TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 40 : 38);

  TextStyle get text46P48TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 48 : 46);
}
