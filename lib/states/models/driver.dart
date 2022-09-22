import 'dart:convert';

List<DriverModel> driverModelFromJson(String str) => List<DriverModel>.from(
    json.decode(str).map((x) => DriverModel.fromJson(x)));

String driverModelToJson(List<DriverModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverModel {
  DriverModel({
    required this.driverId,
    required this.supplierId,
    required this.name,
    required this.phoneNo,
    required this.phoneNo1,
    required this.email,
    required this.address,
    required this.licenceNo,
    required this.licenceExpireDate,
    required this.licenceCountryId,
    required this.vehicleNo,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.username,
    required this.commission,
  });

  int driverId;
  int supplierId;
  String name;
  String phoneNo;
  String phoneNo1;
  String email;
  String address;
  String licenceNo;
  DateTime licenceExpireDate;
  int licenceCountryId;
  String vehicleNo;
  int countryId;
  int stateId;
  int cityId;
  String username;
  double commission;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        driverId: json["driverId"],
        supplierId: json["supplierId"],
        name: json["name"],
        phoneNo: json["phoneNo"],
        phoneNo1: json["phoneNo1"],
        email: json["email"],
        address: json["address"],
        licenceNo: json["licenceNo"],
        licenceExpireDate: DateTime.parse(json["licenceExpireDate"]),
        licenceCountryId: json["licenceCountryId"],
        vehicleNo: json["vehicleNo"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        username: json["username"],
        commission: json["commission"],
      );

  Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "supplierId": supplierId,
        "name": name,
        "phoneNo": phoneNo,
        "phoneNo1": phoneNo1,
        "email": email,
        "address": address,
        "licenceNo": licenceNo,
        "licenceExpireDate": licenceExpireDate.toIso8601String(),
        "licenceCountryId": licenceCountryId,
        "vehicleNo": vehicleNo,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "username": username,
        "commission": commission,
      };
}
