import 'dart:convert';

List<OrderModel> ordersModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

class OrderModel {
  OrderModel({
    required this.invoiceId,
    required this.driverId,
    required this.refNumber,
    required this.productName,
    required this.productImage,
    required this.driverShipmentId,
    required this.totalAmount,
    required this.invoiceDate,
    required this.deliveryDate,
    required this.invoiceStatusId,
    required this.invoiceStatusName,
    required this.paymentStatus,
    required this.customerId,
    required this.storeId,
    required this.storeLatitude,
    required this.storeLongitude,
    required this.customerViewModel,
  });

  int invoiceId;
  int driverId;
  String refNumber;
  String productName;
  String productImage;
  int driverShipmentId;
  double totalAmount;
  String invoiceDate;
  String deliveryDate;
  int invoiceStatusId;
  String invoiceStatusName;
  int paymentStatus;
  int customerId;
  int storeId;
  double storeLatitude;
  double storeLongitude;
  CustomerViewModel customerViewModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        invoiceId: json["invoiceId"],
        driverId: json["driverId"],
        refNumber: json["refNumber"],
        productName: json["productName"] ?? '',
        productImage: json["productImage"],
        driverShipmentId: json["driverShipmentId"],
        totalAmount: json["totalAmount"],
        invoiceDate: json["invoiceDate"],
        deliveryDate: json["deliveryDate"] ?? '',
        invoiceStatusId: json["invoiceStatusId"],
        invoiceStatusName: json["invoiceStatusName"],
        paymentStatus: json["paymentStatus"],
        customerId: json["customerId"],
        storeId: json["storeId"],
        storeLatitude: json["storeLatitude"].toDouble(),
        storeLongitude: json["storeLongitude"].toDouble(),
        customerViewModel:
            CustomerViewModel.fromJson(json["customerViewModel"]),
      );
}

class CustomerViewModel {
  CustomerViewModel({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.totalOrder,
    required this.customerAddressViewModels,
    required this.firstLastName,
  });

  int customerId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String password;
  int totalOrder;
  List<CustomerAddressViewModel> customerAddressViewModels;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerViewModel(
        customerId: json["customerId"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        password: json["password"],
        totalOrder: json["totalOrder"],
        customerAddressViewModels: List<CustomerAddressViewModel>.from(
            json["customerAddressViewModels"]
                .map((x) => CustomerAddressViewModel.fromJson(x))),
        firstLastName: json["firstLastName"],
      );
}

class CustomerAddressViewModel {
  CustomerAddressViewModel({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.address,
    required this.buildingName,
    required this.flatNo,
    required this.nearByLocation,
    required this.status,
    required this.addressLine2,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String address;
  String buildingName;
  String flatNo;
  String nearByLocation;
  String status;
  String addressLine2;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressViewModel(
        customerAddressId: json["customerAddressId"],
        customerId: json["customerId"],
        addressType: json["addressType"] ?? '',
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        address: json["address"] ?? '',
        buildingName: json["buildingName"] ?? '',
        flatNo: json["flatNo"] ?? '',
        nearByLocation: json["nearByLocation"] ?? '',
        status: json["status"] ?? '',
        addressLine2: json["addressLine2"] ?? '',
      );
}
