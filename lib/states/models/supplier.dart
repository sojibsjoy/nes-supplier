import 'dart:convert';

SupplierModel supplierModelFromJson(String str) =>
    SupplierModel.fromJson(json.decode(str));

String supplierModelToJson(SupplierModel data, {bool? noShopImage}) =>
    json.encode(
      data.toJson(noShopImage: noShopImage),
    );

class SupplierModel {
  SupplierModel({
    required this.supplierId,
    required this.supplierName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.contactNumber,
    required this.vatNumber,
    required this.shopTitle,
    required this.guidId,
    required this.storeId,
    required this.bankName,
    required this.branchName,
    required this.bankRoutingNo,
    required this.bankAccountNo,
    required this.shopName,
    required this.shopImage,
    required this.totalAmount,
    required this.totalOrder,
    required this.image,
    required this.earnThisMonth,
  });

  int supplierId;
  String supplierName;
  String mobile;
  String email;
  String address;
  String contactNumber;
  String vatNumber;
  String shopTitle;
  String guidId;
  int storeId;
  String bankName;
  String branchName;
  String bankRoutingNo;
  String bankAccountNo;
  String shopName;
  String shopImage;
  double totalAmount;
  double totalOrder;
  String image;
  double earnThisMonth;

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        contactNumber: json["contactNumber"],
        vatNumber: json["vatNumber"],
        shopTitle: json["shopTitle"],
        guidId: json["guidId"],
        storeId: json["storeId"],
        bankName: json["bankName"],
        branchName: json["branchName"],
        bankRoutingNo: json["bankRoutingNo"],
        bankAccountNo: json["bankAccountNo"],
        shopName: json["shopName"] ?? '',
        shopImage: json["shopImage"] ?? '',
        totalAmount: json["totalAmount"] ?? 0.0,
        totalOrder: json["totalOrder"] ?? 0.0,
        image: json["image"] ?? '',
        earnThisMonth: json["earnThisMonth"] ?? 0.0,
      );

  Map<String, dynamic> toJson({
    bool? noShopImage,
  }) =>
      {
        "supplierId": supplierId,
        "supplierName": supplierName,
        "mobile": mobile,
        "email": email,
        "address": address,
        "contactNumber": contactNumber,
        "vatNumber": vatNumber,
        "shopTitle": shopTitle,
        "guidId": guidId,
        "storeId": storeId,
        "bankName": bankName,
        "branchName": branchName,
        "bankRoutingNo": bankRoutingNo,
        "bankAccountNo": bankAccountNo,
        "shopName": shopName,
        if (noShopImage == null) "shopImage": shopImage,
      };
}
