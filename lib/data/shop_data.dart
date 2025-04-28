import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuira_fan_verse/core/models/shop.dart';

class ShopData extends ChangeNotifier {
  List<Shop> listShop = [];
  Future<void> getShop() async {
    String jsonString = await rootBundle.loadString('assets/shop.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> shopData = data['shop'];

    for(var newData in shopData){
      Shop shop = Shop.fromMap(newData);
      listShop.add(shop);
    }
  }
}