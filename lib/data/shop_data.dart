import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuira_fan_verse/core/models/shop.dart';

class ShopData extends ChangeNotifier {
  List<Shop> listShop = [];
  Future<void> getShop() async {
    if (listShop.isNotEmpty) return; // evita carregar de novo
    String jsonString = await rootBundle.loadString('assets/shop.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> shopData = data['shop'];
    listShop = shopData.map((e) => Shop.fromMap(e)).toList();
    print("Itens carregados: ${listShop.length}");
    notifyListeners();
  }

  List<Shop> getByType(String type) {
    return listShop.where((item) => item.type == type).toList();
  }
}
