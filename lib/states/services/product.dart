import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProductService {
  static Future<dynamic> getDashboardData({
    required int supplierId,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kDashboard + supplierId.toString(),
    );
    return response;
  }

  static Future<dynamic> getProducts({
    required int supplierId,
    List<int>? categoryIds,
    List<int>? brandIds,
    double? minPrice,
    double? maxPrice,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kProductsFilter,
      body: {
        "supplierId": '$supplierId',
        "categoryIds": jsonEncode(categoryIds),
        "brandIds": jsonEncode(brandIds),
        "minPrice": '$minPrice',
        "maxPrice": '$maxPrice',
      },
    );
    return response;
  }

  static Future<dynamic> getCategories() async {
    var response = await BaseClient.getData(api: ConstantStrings.kCategories);
    return response;
  }

  static Future<dynamic> getBrands() async {
    var response = await BaseClient.getData(api: ConstantStrings.kBrands);
    return response;
  }
}
