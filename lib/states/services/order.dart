import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class OrderService {
  // Login Function
  static Future<dynamic> getOrders({
    int? invoiceStatusId,
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

  // static Future<dynamic> getOrderDetails({
  //   required int invoiceMasterId,
  //   required int invoiceId,
  // }) async {
  //   var response = await BaseClient.getData(
  //     api: ConstantStrings.kOrderDetails,
  //     parameter: {
  //       "invoiceMasterId": '$invoiceMasterId',
  //       "invoiceId": '$invoiceId',
  //     },
  //   );
  //   return response;
  // }

  static Future<dynamic> getDriverList({
    required int supplierId,
  }) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kDriverList,
      parameter: {
        "supplierId": '$supplierId',
      },
    );
    return response;
  }

  static Future<dynamic> forwardToTheDriver({
    required dynamic payload,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kShippedToTheDriver,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> updateOrderStatus({
    required int invoiceId,
  }) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kUpdateOrderStatus,
      parameter: {
        "invoiceId": '$invoiceId',
        "invoiceStatusId": ConstantStrings.kDeliveredOrderID,
      },
    );
    return response;
  }
}
