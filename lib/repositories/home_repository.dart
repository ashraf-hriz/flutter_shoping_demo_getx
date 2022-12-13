import 'dart:convert';
import 'dart:developer';

import 'package:flutter_demo_task/models/category_model.dart';
import 'package:flutter_demo_task/models/product_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeRepository {
  static Future<List<Category>> getAllCategoryData() async {
    String response = await rootBundle.loadString('assets/mocks/category.json');
    List<dynamic> result = json.decode(response);
    log('result $result');
    return result.map((item) => Category.fromJson(item)).toList();
  }

  static Future<List<Product>> getAllProductData() async {
    String response = await rootBundle.loadString('assets/mocks/products.json');
    List<dynamic> result = json.decode(response);
    log('resultP $result');
    return result.map((item) => Product.fromJson(item)).toList();
  }
}
