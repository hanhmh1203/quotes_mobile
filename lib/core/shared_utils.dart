import 'dart:async';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  // SharedPreferences prefs;
  static String keyDBInit = 'key_database_init';

  SharedUtils();

  saveDBInit(bool isInit) {
    _addBoolToSF(keyDBInit, isInit);
  }

  Future<bool> isDBInit() async {
    return await _getBoolFromSF(keyDBInit) ?? false;
  }

  _addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getStringFromSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  _addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int?> _getIntFromSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  _addDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double?> _getDoubleFromSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  _addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> _getBoolFromSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
