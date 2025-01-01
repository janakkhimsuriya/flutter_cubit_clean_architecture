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

  TextStyle get text6P10TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 10 : 6);

  TextStyle get text8P12TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 12 : 8);

  TextStyle get text10P14TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 14 : 10);

  TextStyle get text12P16TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 16 : 12);

  TextStyle get text13P17TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 17 : 13);

  TextStyle get text14P18TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 18 : 14);

  TextStyle get text16P20TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 20 : 16);

  TextStyle get text18P22TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 22 : 18);

  TextStyle get text20P24TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 24 : 20);

  TextStyle get text22P26TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 26 : 22);

  TextStyle get text24P28TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 28 : 24);

  TextStyle get text26P30TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 30 : 26);

  TextStyle get text28P32TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 32 : 28);

  TextStyle get text36P40TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 40 : 36);

  TextStyle get text44P48TText =>
      _textStyle.copyWith(fontSize: _isTablet() ? 48 : 44);
}
