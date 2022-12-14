
import 'package:flutter_demo_task/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var _products = {}.obs;


  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void addProductFromHome(Product product) {
    if (_products.containsKey(product)) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] = 1;
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get totalPrice => (_products.isEmpty)?'0':_products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(1);

}