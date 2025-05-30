import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;

import '../data/json_models/quote_json_model.dart';

class ReadJsonFileHelper {
  static Future<Map<String, dynamic>> _readJsonData({required String path}) async {
    // read json file
    final jsonData = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsonData) as Map<String, dynamic>;

    // map json and initialize
    // using DataModel
    return list;
  }

  static Future<List<QuoteJsonModel>> readDummyData() async {
    var path = "assets/json/dummy.json";
    final list = await _readJsonData(path: path);
    // Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
    QuotesResponse quotesResponse = QuotesResponse.fromJson(list);
    print("readDummyData ${quotesResponse.toJson()}");
    return quotesResponse.data;
  }
}
