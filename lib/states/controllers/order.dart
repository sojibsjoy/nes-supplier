import 'dart:convert';

import 'package:dogventurehq/states/models/driver.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/services/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool ordersLoading = true.obs;
  RxBool driverLoading = true.obs;

  List<OrderModel> orderList = List.empty();
  List<DriverModel> driverList = List.empty();

  void getCurrentOrders({
    required int invoiceStatusID,
    required int supplierID,
  }) async {
    ordersLoading(true);
    try {
      var response = await OrderService.getCurrentOrders(
        invoiceStatusId: invoiceStatusID,
        supplierId: supplierID,
      );
      orderList = orderModelFromJson(jsonEncode(response));
    } finally {
      ordersLoading(false);
    }
  }

  void getDriverList({
    required int supplierID,
  }) async {
    driverLoading(true);
    try {
      var response = await OrderService.getDriverList(
        supplierId: supplierID,
      );
      driverList = driverModelFromJson(jsonEncode(response));
    } finally {
      driverLoading(false);
    }
  }
}
