import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuira_fan_verse/core/models/news.dart';

class NewsData extends ChangeNotifier {
  List<News> listNews = [];
  Future<void> getNews() async {
    String jsonString = await rootBundle.loadString('assets/news.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> newsData = data['news'];

    for(var newData in newsData){
      News news = News.fromMap(newData);
      listNews.add(news);
    }
  }
}