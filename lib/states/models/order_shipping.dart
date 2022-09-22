import 'dart:convert';

OrderShippingModel orderShippingModelFromJson(String str) =>
    OrderShippingModel.fromJson(json.decode(str));

String orderShippingModelToJson(OrderShippingModel data) =>
    json.encode(data.toJson());

class OrderShippingModel {
  OrderShippingModel({
    required this.driverShipmentId,
    required this.driverId,
    required this.shipmentDate,
    required this.note,
    required this.createdAt,
    required this.createBy,
    required this.invoiceStatusId,
    required this.driversOrderViewModels,
  });

  int driverShipmentId;
  int driverId;
  DateTime shipmentDate;
  String note;
  DateTime createdAt;
  int createBy;
  int invoiceStatusId;
  List<DriversOrderViewModel> driversOrderViewModels;

  factory OrderShippingModel.fromJson(Map<String, dynamic> json) =>
      OrderShippingModel(
        driverShipmentId: json["driverShipmentId"],
        driverId: json["driverId"],
        shipmentDate: DateTime.parse(json["shipmentDate"]),
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        createBy: json["createBy"],
        invoiceStatusId: json["invoiceStatusId"],
        driversOrderViewModels: List<DriversOrderViewModel>.from(
            json["driversOrderViewModels"]
                .map((x) => DriversOrderViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "driverShipmentId": driverShipmentId,
        "driverId": driverId,
        "shipmentDate": shipmentDate.toIso8601String(),
        "note": note,
        "createdAt": createdAt.toIso8601String(),
        "createBy": createBy,
        "invoiceStatusId": invoiceStatusId,
        "driversOrderViewModels":
            List<dynamic>.from(driversOrderViewModels.map((x) => x.toJson())),
      };
}

class DriversOrderViewModel {
  DriversOrderViewModel({
    required this.driversOrderId,
    required this.driverShipmentId,
    required this.invoiceId,
  });

  int driversOrderId;
  int driverShipmentId;
  int invoiceId;

  factory DriversOrderViewModel.fromJson(Map<String, dynamic> json) =>
      DriversOrderViewModel(
        driversOrderId: json["driversOrderId"],
        driverShipmentId: json["driverShipmentId"],
        invoiceId: json["invoiceId"],
      );

  Map<String, dynamic> toJson() => {
        "driversOrderId": driversOrderId,
        "driverShipmentId": driverShipmentId,
        "invoiceId": invoiceId,
      };
}
