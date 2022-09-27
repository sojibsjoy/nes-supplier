import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProductService {
  static Future<dynamic> getProducts({
    required int supplierId,
    int? categoryId,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kProductsFilter,
      body: {
        "supplierId": '$supplierId',
        "categoryIds": jsonEncode([categoryId]),
      },
    );
    return response;
  }

  static Future<dynamic> getCategories() async {
    var response = await BaseClient.getData(api: ConstantStrings.kCategories);
    return response;
  }
}
