import 'dart:convert';

import 'package:dogventurehq/states/models/brand.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/models/dashboard.dart';
import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/states/services/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool dashboardLoading = true.obs;
  RxBool productsLoading = true.obs;
  RxBool categoriesLoading = true.obs;
  RxBool brandsLoading = true.obs;

  DashboardModel? dashboardData;
  ProductsModel? products;
  List<CategoryModel> categories = List.empty();
  List<BrandModel> brands = List.empty();

  void getDashboardData({
    required int supplierID,
  }) async {
    dashboardLoading(true);
    try {
      var response = await ProductService.getDashboardData(
        supplierId: supplierID,
      );
      dashboardData = dashboardModelFromJson(jsonEncode(response));
    } finally {
      dashboardLoading(false);
    }
  }

  void getProducts({
    required int supplierID,
    List<int>? categoryIDs,
    List<int>? brandIDs,
    double? minPrice,
    double? maxPrice,
  }) async {
    productsLoading(true);
    // Methods.showLoading();
    try {
      var response = await ProductService.getProducts(
        supplierId: supplierID,
        categoryIds: categoryIDs,
        brandIds: brandIDs,
        minPrice: minPrice,
        maxPrice: maxPrice,
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

  void getBrands() async {
    brandsLoading(true);
    try {
      var response = await ProductService.getBrands();
      brands = brandModelFromJson(
        jsonEncode(response),
      );
    } finally {
      brandsLoading(false);
    }
  }
}
