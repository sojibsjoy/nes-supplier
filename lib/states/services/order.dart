import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class OrderService {
  // Login Function
  static Future<dynamic> getCurrentOrders({
    required int supplierId,
  }) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kCurrentOrders,
      parameter: {
        "SupplierId": '$supplierId',
      },
    );
    return response;
  }
}
