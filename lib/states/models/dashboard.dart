import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

class DashboardModel {
  DashboardModel({
    // required this.orderSales,
    required this.invoice,
    required this.totalOrder,
    required this.totalSales,
    required this.totalSaleThisMonth,
    required this.totalSaleThisWeek,
    required this.totalSaleDaily,
    required this.totalOrderThisMonth,
    required this.totalOrderThisWeek,
    required this.totalOrderDaily,
    // required this.bestSellingProduct,
    required this.suppliers,
  });

  // List<dynamic> orderSales;
  List<Invoice> invoice;
  int totalOrder;
  int totalSales;
  int totalSaleThisMonth;
  int totalSaleThisWeek;
  int totalSaleDaily;
  int totalOrderThisMonth;
  int totalOrderThisWeek;
  int totalOrderDaily;
  // dynamic bestSellingProduct;
  List<Supplier> suppliers;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        // orderSales: List<dynamic>.from(json["orderSales"].map((x) => x)),
        invoice:
            List<Invoice>.from(json["invoice"].map((x) => Invoice.fromJson(x))),
        totalOrder: json["totalOrder"],
        totalSales: json["totalSales"],
        totalSaleThisMonth: json["totalSaleThisMonth"],
        totalSaleThisWeek: json["totalSaleThisWeek"],
        totalSaleDaily: json["totalSaleDaily"],
        totalOrderThisMonth: json["totalOrderThisMonth"],
        totalOrderThisWeek: json["totalOrderThisWeek"],
        totalOrderDaily: json["totalOrderDaily"],
        // bestSellingProduct: json["bestSellingProduct"],
        suppliers: List<Supplier>.from(
            json["suppliers"].map((x) => Supplier.fromJson(x))),
      );
}

class Invoice {
  Invoice({
    required this.invoiceId,
    required this.orderRefNumber,
    required this.invoiceDate,
    required this.masterRefNumber,
    required this.orderDate,
    required this.price,
    required this.statusName,
    required this.invoiceMasterId,
    required this.invoiceStatusId,
    required this.customerName,
  });

  int invoiceId;
  String orderRefNumber;
  DateTime invoiceDate;
  String masterRefNumber;
  DateTime orderDate;
  double price;
  String statusName;
  int invoiceMasterId;
  int invoiceStatusId;
  String customerName;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        invoiceId: json["invoiceId"],
        orderRefNumber: json["orderRefNumber"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        masterRefNumber: json["masterRefNumber"],
        orderDate: DateTime.parse(json["orderDate"]),
        price: json["price"],
        statusName: json["statusName"],
        invoiceMasterId: json["invoiceMasterId"],
        invoiceStatusId: json["invoiceStatusId"],
        customerName: json["customerName"],
      );
}

class Supplier {
  Supplier({
    required this.supplierId,
    required this.supplierName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.contactNumber,
    required this.shopTitle,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.countryName,
    required this.stateName,
    required this.cityName,
    required this.supplierDetailsViewModel,
    required this.bankName,
    required this.branchName,
    required this.bankRoutingNo,
    required this.bankAccountNo,
  });

  int supplierId;
  String supplierName;
  String mobile;
  String email;
  String address;
  String contactNumber;
  String shopTitle;
  int countryId;
  int stateId;
  int cityId;
  String countryName;
  String stateName;
  String cityName;
  List<Map<String, dynamic>> supplierDetailsViewModel;
  String bankName;
  String branchName;
  String bankRoutingNo;
  String bankAccountNo;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        contactNumber: json["contactNumber"],
        shopTitle: json["shopTitle"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        supplierDetailsViewModel: List<Map<String, dynamic>>.from(
            json["supplierDetailsViewModel"].map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        bankName: json["bankName"],
        branchName: json["branchName"],
        bankRoutingNo: json["bankRoutingNo"],
        bankAccountNo: json["bankAccountNo"],
      );
}
