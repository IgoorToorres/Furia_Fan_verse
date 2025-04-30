import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuira_fan_verse/core/models/notification_filter.dart';
import 'dart:convert';

class FilterData with ChangeNotifier {
  NotificationFilter _filter = NotificationFilter(
    cs: true,
    kingsLeague: true,
    valorant: true,
    lol: true,
    r6: true,
  );

  NotificationFilter get currentFilter => _filter;

  FilterData() {
    loadFilters(); // Carrega os filtros assim que for criado
  }

  void updateFilter(NotificationFilter newFilter) async {
    _filter = newFilter;
    notifyListeners();
    await saveFilters(); // Salva ao atualizar
  }

  bool isEnabled(String game) {
    return _filter.isGameEnabled(game);
  }

  Future<void> saveFilters() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(_filter.toMap());
    await prefs.setString('user_filters', jsonString);
  }

  Future<void> loadFilters() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user_filters');
    if (jsonString != null) {
      final Map<String, dynamic> map = jsonDecode(jsonString);
      final loadedFilter = NotificationFilter.fromMap(
        map.map((key, value) => MapEntry(key, value as bool)),
      );
      _filter = loadedFilter;
      notifyListeners();
    }
  }
}
