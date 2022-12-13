import 'package:flutter_demo_task/models/category_model.dart';
import 'package:flutter_demo_task/models/product_model.dart';
import 'package:flutter_demo_task/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var products = <Product>[];
  var categories = <Category>[];
  var categoryLoading = true.obs;
  var productLoading = true.obs;

  var pageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategoriesData();
    fetchProductData();
  }

  fetchProductData() async {
    try {
      productLoading(true);
      var items = await HomeRepository.getAllProductData();
      products = items;
    } finally {
      productLoading(false);
    }
  }

  fetchCategoriesData() async {
    try {
      categoryLoading(true);
      var items = await HomeRepository.getAllCategoryData();
      categories = items;
      print('categoryLen ${categories.length}');
    } finally {
      categoryLoading(false);
    }
  }

  changFavouriteStatus(int productIndex) {
    //productLoading(true);
    print('change status ${products[productIndex].favorite}');
    var currentStat = products[productIndex].favorite;
    products[productIndex].favorite = !currentStat!;
    productLoading(true);
    productLoading(false);
    //products(products);
    print('change status ${products[productIndex].favorite}');
  }

  changPageIndex(int index) {
    if (pageIndex.value != index) {
      pageIndex(index);
    }
  }
}
