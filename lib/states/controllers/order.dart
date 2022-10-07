import 'dart:convert';

import 'package:dogventurehq/states/models/driver.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/order_shipping.dart';
import 'package:dogventurehq/states/services/order.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool ordersLoading = true.obs;
  RxBool driverLoading = true.obs;
  RxBool orderShippedLoading = true.obs;
  RxBool orderStatusUpdated = false.obs;

  List<OrderModel> orderList = List.empty();
  List<DriverModel> driverList = List.empty();
  OrderShippingModel? orderShippingModel;

  void getOrders({
    int? invoiceStatusID,
    required int supplierID,
  }) async {
    ordersLoading(true);
    try {
      var response = await OrderService.getOrders(
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

  void forwardToDriver({
    required OrderShippingModel oShippedModel,
  }) async {
    orderShippedLoading(true);
    Methods.showLoading();
    try {
      var response = await OrderService.forwardToTheDriver(
        payload: oShippedModel.toJson(),
      );
      orderShippingModel = orderShippingModelFromJson(jsonEncode(response));
      // if (orderShippingModel != null) {
      //   print(orderShippingModel!.driverShipmentId);
      // }
    } finally {
      Methods.hideLoading();
      orderShippedLoading(false);
    }
  }

  void updateOrderStatus({
    required int invoiceID,
  }) async {
    Methods.showLoading();
    try {
      var response = await OrderService.updateOrderStatus(
        invoiceId: invoiceID,
      );
      print(response);
    } finally {
      orderStatusUpdated(true);
      Methods.hideLoading();
      Methods.showSnackbar(
        title: "Status Updated!",
        msg: "Order status changed to delivered sucessfully!",
        position: SnackPosition.TOP,
      );
    }
  }
}
