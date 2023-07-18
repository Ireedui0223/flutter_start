import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> card = [];

  fetchMenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = response.body;
      _menu = [];
      var decodeData = jsonDecode(body) as List<dynamic>;
      for (var json in decodeData) {
        _menu?.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }
    return _menu!;
  }

  cartAdd(Product p) {
    bool found = false;
    for (var item in card) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
    }
    if (!found) {
      card.add(ItemInCart(product: p, quantity: 1));
    }
  }

  cardRemove(Product p) {
    card.removeWhere((element) => element.product.id == p.id);
  }

  cartClear() {
    card.clear();
  }

  double cardTotal() {
    double total = 0;

    for (var item in card) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
