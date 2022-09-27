import 'dart:convert';

import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/states/services/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool productsLoading = true.obs;
  RxBool categoriesLoading = true.obs;

  ProductsModel? products;
  List<CategoryModel> categories = List.empty();

  void getProducts({
    required int supplierID,
    int? categoryID,
  }) async {
    productsLoading(true);
    // Methods.showLoading();
    try {
      var response = await ProductService.getProducts(
        supplierId: supplierID,
        categoryId: categoryID,
      );
      products = ProductsModel.fromJson(response);
    } finally {
      // Methods.hideLoading();
      productsLoading(false);
    }
  }

  void getCategories() async {
    categoriesLoading(true);
    try {
      var response = await ProductService.getCategories();
      categories = categoryModelFromJson(
        jsonEncode(response),
      );
    } finally {
      categoriesLoading(false);
    }
  }
}
