import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_class/model_class.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> _map = {};

  Map<String,dynamic> get map => _map;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-12-26&sortBy=publishedAt&apiKey=6eabe6c2e0ed4d1c83d9f9c077ec7eb6"));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        notifyListeners();
      } catch (e) {
        print("Error");
      }
    } else {
      print("Error");
    }
    notifyListeners();
  }
}
