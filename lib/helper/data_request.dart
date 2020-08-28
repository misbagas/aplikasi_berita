import 'dart:convert';

import 'package:aplikasi_berita/models/ResponseNews.dart';
import 'package:http/http.dart' as http;

String apikey = "242e67d4f9054c0f868bbb061615ba54";

class News {
  Future<ResponseNews> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apikey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

class NewsByCategory {
  Future<ResponseNews> getNewsByCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apikey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}
