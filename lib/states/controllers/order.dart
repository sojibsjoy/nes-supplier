import 'dart:convert';

import 'package:dogventurehq/states/models/orders.dart';
import 'package:dogventurehq/states/services/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool currentOrdersLoading = true.obs;

  List<OrderModel> currentOrders = List.empty();

  void getCurrentOrders({
    required int invoiceStatusID,
    required int supplierID,
  }) async {
    currentOrdersLoading(true);
    try {
      var response = await OrderService.getCurrentOrders(
        invoiceStatusId: invoiceStatusID,
        supplierId: supplierID,
      );
      currentOrders = orderModelFromJson(jsonEncode(response));
    } finally {
      currentOrdersLoading(false);
    }
  }
}
