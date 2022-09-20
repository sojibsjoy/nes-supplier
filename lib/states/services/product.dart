import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProductService {
  // Login Function
  static Future<dynamic> getProducts({
    required int supplierId,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kProductsFilter,
      body: {
        "supplierId": '$supplierId',
      },
    );
    return response;
  }
}
