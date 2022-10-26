import 'dart:convert';

OrderShippingModel orderShippingModelFromJson(String str) =>
    OrderShippingModel.fromJson(json.decode(str));

String orderShippingModelToJson(OrderShippingModel data) =>
    json.encode(data.toJson());

class OrderShippingModel {
  OrderShippingModel({
    this.driverShipmentId,
    required this.driverId,
    required this.shipmentDate,
    required this.note,
    //  this.createdAt,
    this.createBy,
    required this.invoiceStatusId,
    required this.driversOrderViewModels,
  });

  int? driverShipmentId;
  int driverId;
  String shipmentDate;
  String note;
  // DateTime? createdAt;
  int? createBy;
  int invoiceStatusId;
  List<DriversOrderViewModel> driversOrderViewModels;

  factory OrderShippingModel.fromJson(Map<String, dynamic> json) =>
      OrderShippingModel(
        driverShipmentId: json["driverShipmentId"],
        driverId: json["driverId"],
        shipmentDate: json["shipmentDate"],
        note: json["note"],
        // createdAt: json["createdAt"],
        createBy: json["createBy"] ?? 0,
        invoiceStatusId: json["invoiceStatusId"],
        driversOrderViewModels: List<DriversOrderViewModel>.from(
            json["driversOrderViewModels"]
                .map((x) => DriversOrderViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "driverShipmentId": driverShipmentId,
        "driverId": driverId,
        "shipmentDate": shipmentDate,
        "note": note,
        // "createdAt": createdAt.toIso8601String(),
        // "createBy": createBy,
        "invoiceStatusId": invoiceStatusId,
        "driversOrderViewModels":
            List<dynamic>.from(driversOrderViewModels.map((x) => x.toJson())),
      };
}

class DriversOrderViewModel {
  DriversOrderViewModel({
    this.driversOrderId,
    this.driverShipmentId,
    required this.invoiceId,
  });

  int? driversOrderId;
  int? driverShipmentId;
  int invoiceId;

  factory DriversOrderViewModel.fromJson(Map<String, dynamic> json) =>
      DriversOrderViewModel(
        driversOrderId: json["driversOrderId"],
        driverShipmentId: json["driverShipmentId"] ?? 0,
        invoiceId: json["invoiceId"],
      );

  Map<String, dynamic> toJson() => {
        // "driversOrderId": driversOrderId,
        // "driverShipmentId": driverShipmentId,
        "invoiceId": invoiceId,
      };
}
