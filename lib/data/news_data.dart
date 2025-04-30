import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/models/news.dart';

class NewsData extends ChangeNotifier {
  List<News> listNews = [];

  NewsData() {
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      String jsonString = await rootBundle.loadString('assets/news.json');
      Map<String, dynamic> data = jsonDecode(jsonString);
      List<dynamic> newsData = data['news'];

      listNews = newsData.map((item) => News.fromMap(item)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao carregar notícias: $e');
    }
  }
}
