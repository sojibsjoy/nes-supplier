import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class OrderService {
  // Login Function
  static Future<dynamic> getCurrentOrders({
    required int invoiceStatusId,
    required int supplierId,
  }) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kGetOrderByStatusID,
      parameter: {
        "invoiceStatusId": '$invoiceStatusId',
        "supplierId": '$supplierId',
      },
    );
    return response;
  }
}
