import 'dart:convert';

import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences wrapper around basic key-values
class PreferenceManager {
  /// generate instance for PreferenceManager which takes instance of
  /// SharedPreferences
  PreferenceManager(this._preferences);

  static const String _prefTypeBool = 'bool';
  static const String _prefTypeStringList = 'string_list';
  static const String _prefTypeInteger = 'int';
  static const String _prefTypeDouble = 'double';
  static const String _prefTypeString = 'string';

  static const String _prefLanguage = 'lang';
  static const String _prefNotification = 'notification';
  static const String _prefUser = 'user';
  static const String _prefToken = 'token';

  final SharedPreferencesAsync _preferences;

  Future<void> _setPref(String key, dynamic value, String type) async {
    switch (type) {
      case _prefTypeBool:
        return _preferences.setBool(key, value as bool);
      case _prefTypeInteger:
        return _preferences.setInt(key, value as int);
      case _prefTypeDouble:
        return _preferences.setDouble(key, value as double);
      case _prefTypeString:
        return _preferences.setString(key, value as String);
      case _prefTypeStringList:
        return _preferences.setStringList(key, value as List<String>);
    }
  }

  // ignore: unused_element
  Future<bool> _getBoolPref(
    String key, {
    bool defValue = false,
  }) async {
    return await _preferences.getBool(key) ?? defValue;
  }

  // ignore: unused_element
  Future<int> _getIntPref(
    String key, {
    int defValue = 0,
  }) async {
    return await _preferences.getInt(key) ?? defValue;
  }

  // ignore: unused_element
  Future<double> _getDoublePref(
    String key, {
    double defValue = 0,
  }) async {
    return await _preferences.getDouble(key) ?? defValue;
  }

  Future<String> _getStringPref(
    String key, {
    String defValue = '',
  }) async {
    return await _preferences.getString(key) ?? defValue;
  }

  // ignore: unused_element
  Future<List<String>> _getStringListPref(
    String key, {
    List<String> defValue = const <String>[],
  }) async {
    return await _preferences.getStringList(key) ?? defValue;
  }

  Future<void> _removePreference(String key) async {
    return _preferences.remove(key);
  }

  /// Sets the language for the App
  Future<void> setLanguage(String languageCode) async {
    return _setPref(_prefLanguage, languageCode, _prefTypeString);
  }

  /// Returns current language of the app
  Future<String> getLanguage() async {
    return _getStringPref(
      _prefLanguage,
      defValue: AppLocalization.localeCodeEn,
    );
  }

  /// clears the language storage, App will fallback in English as default
  Future<void> clearLanguage() async {
    return _removePreference(_prefLanguage);
  }

  Future<void> setNotifications(String jsonData) async {
    return _setPref(_prefNotification, jsonData, _prefTypeString);
  }

  Future<String> getNotifications() async {
    return _getStringPref(
      _prefNotification,
      defValue: '[]',
    );
  }

  Future<void> clearNotifications() async {
    return _removePreference(_prefNotification);
  }

  Future<void> setUserProfile(UserProfile data) {
    return _setPref(_prefUser, jsonEncode(data.toJson()), _prefTypeString);
  }

  Future<UserProfile?> getUserProfile() async {
    final data = await _getStringPref(_prefUser);
    if (data.isNotEmpty) {
      return UserProfile.fromJson(jsonDecode(data) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<String?> getToken() async {
    return _getStringPref(_prefToken);
  }

  Future<bool> isAuthenticated() async {
    final data = await getUserProfile();
    return data != null;
  }

  Future<void> clearUser() async {
    return _removePreference(_prefUser);
  }
}
