import 'dart:async';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  SharedPreferences prefs;
  static String keyDBInit = 'key_database_init';

  SharedUtils({required this.prefs});

  saveDBInit(bool isInit) {
    _addBoolToSF(keyDBInit, isInit);
  }

  isDBInit() {
    return _getBoolFromSF(keyDBInit);
  }

  _addStringToSF(String key, String value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  String? _getStringFromSF(String key) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  _addIntToSF(String key, int value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  int? _getIntFromSF(String key) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  _addDoubleToSF(String key, double value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  double? _getDoubleFromSF(String key, double value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  _addBoolToSF(String key, bool value) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  bool? _getBoolFromSF(String key) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
