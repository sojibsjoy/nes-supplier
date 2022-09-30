import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

class DashboardModel {
  DashboardModel({
    required this.orderSales,
    // required this.invoice,
    // required this.productOrderView,
    required this.totalOrder,
    required this.totalSales,
    required this.totalSaleThisMonth,
    required this.totalSaleThisWeek,
    required this.maxTotalSaleDaily,
    required this.totalOrderThisMonth,
    required this.totalOrderThisWeek,
    required this.maxTotalOrderDaily,
    // required this.bestSellingProduct,
    // required this.customerViewModel,
    required this.suppliers,
  });

  OrderSales orderSales;
  // dynamic invoice;
  // dynamic productOrderView;
  int totalOrder;
  int totalSales;
  int totalSaleThisMonth;
  int totalSaleThisWeek;
  double maxTotalSaleDaily;
  int totalOrderThisMonth;
  int totalOrderThisWeek;
  int maxTotalOrderDaily;
  // dynamic bestSellingProduct;
  // dynamic customerViewModel;
  Suppliers suppliers;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        orderSales: OrderSales.fromJson(json["orderSales"]),
        // invoice: json["invoice"],
        // productOrderView: json["productOrderView"],
        totalOrder: json["totalOrder"],
        totalSales: json["totalSales"],
        totalSaleThisMonth: json["totalSaleThisMonth"] ?? 0,
        totalSaleThisWeek: json["totalSaleThisWeek"] ?? 0,
        maxTotalSaleDaily: json["maxTotalSaleDaily"],
        totalOrderThisMonth: json["totalOrderThisMonth"] ?? 0,
        totalOrderThisWeek: json["totalOrderThisWeek"] ?? 0,
        maxTotalOrderDaily: json["maxTotalOrderDaily"],
        // bestSellingProduct: json["bestSellingProduct"],
        // customerViewModel: json["customerViewModel"],
        suppliers: Suppliers.fromJson(json["suppliers"]),
      );
}

class OrderSales {
  OrderSales({
    required this.orderOverViewId,
    // required this.month,
    // required this.year,
    // required this.totalOrder,
    // required this.totalSales,
    // required this.supplierId,
    // required this.lastUpdateDate,
    required this.orderOverViewMonthlyViewModels,
    required this.orderOverViewDailyViewModels,
  });

  int orderOverViewId;
  // dynamic month;
  // dynamic year;
  // dynamic totalOrder;
  // dynamic totalSales;
  // dynamic supplierId;
  // dynamic lastUpdateDate;
  List<OrderOverViewLyViewModel> orderOverViewMonthlyViewModels;
  List<OrderOverViewLyViewModel> orderOverViewDailyViewModels;

  factory OrderSales.fromJson(Map<String, dynamic> json) => OrderSales(
        orderOverViewId: json["orderOverViewId"],
        // month: json["month"],
        // year: json["year"],
        // totalOrder: json["totalOrder"],
        // totalSales: json["totalSales"],
        // supplierId: json["supplierId"],
        // lastUpdateDate: json["lastUpdateDate"],
        orderOverViewMonthlyViewModels: List<OrderOverViewLyViewModel>.from(
            json["orderOverViewMonthlyViewModels"]
                .map((x) => OrderOverViewLyViewModel.fromJson(x))),
        orderOverViewDailyViewModels: List<OrderOverViewLyViewModel>.from(
            json["orderOverViewDailyViewModels"]
                .map((x) => OrderOverViewLyViewModel.fromJson(x))),
      );
}

class OrderOverViewLyViewModel {
  OrderOverViewLyViewModel({
    required this.day,
    required this.dayName,
    required this.month,
    required this.year,
    required this.totalOrder,
    required this.totalAmount,
    required this.supplierId,
    // required this.lastUpdateDate,
    required this.monthName,
  });

  int day;
  String dayName;
  int month;
  int year;
  int totalOrder;
  double totalAmount;
  int supplierId;
  // dynamic lastUpdateDate;
  String monthName;

  factory OrderOverViewLyViewModel.fromJson(Map<String, dynamic> json) =>
      OrderOverViewLyViewModel(
        day: json["day"] ?? 0,
        dayName: json["dayName"] ?? '',
        month: json["month"],
        year: json["year"],
        totalOrder: json["totalOrder"],
        totalAmount: json["totalAmount"],
        supplierId: json["supplierId"],
        // lastUpdateDate: json["lastUpdateDate"],
        monthName: json["monthName"] ?? '',
      );
}

class Suppliers {
  Suppliers({
    required this.supplierId,
    required this.supplierName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.contactNumber,
    required this.shopTitle,
    required this.shopBanner,
    required this.companyLogo,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.countryName,
    required this.stateName,
    required this.cityName,
    required this.supplierDetailsViewModels,
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
  String shopBanner;
  String companyLogo;
  int countryId;
  int stateId;
  int cityId;
  String countryName;
  String stateName;
  String cityName;
  List<SupplierDetailsViewModel> supplierDetailsViewModels;
  String bankName;
  String branchName;
  String bankRoutingNo;
  String bankAccountNo;

  factory Suppliers.fromJson(Map<String, dynamic> json) => Suppliers(
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        contactNumber: json["contactNumber"],
        shopTitle: json["shopTitle"],
        shopBanner: json["shopBanner"],
        companyLogo: json["companyLogo"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
        supplierDetailsViewModels: List<SupplierDetailsViewModel>.from(
            json["supplierDetailsViewModel"]
                .map((x) => SupplierDetailsViewModel.fromJson(x))),
        bankName: json["bankName"],
        branchName: json["branchName"],
        bankRoutingNo: json["bankRoutingNo"],
        bankAccountNo: json["bankAccountNo"],
      );
}

class SupplierDetailsViewModel {
  SupplierDetailsViewModel({
    required this.supplierDetailsId,
    required this.supplierId,
    required this.totalOrder,
    required this.cancelledOrder,
    required this.deliveredOrder,
    required this.pendingToResponse,
    required this.orderInQueue,
    required this.products,
    required this.totalAmount,
    required this.paid,
    required this.due,
  });

  int supplierDetailsId;
  int supplierId;
  int totalOrder;
  int cancelledOrder;
  int deliveredOrder;
  int pendingToResponse;
  int orderInQueue;
  int products;
  double totalAmount;
  double paid;
  double due;

  factory SupplierDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      SupplierDetailsViewModel(
        supplierDetailsId: json["supplierDetailsId"],
        supplierId: json["supplierId"],
        totalOrder: json["totalOrder"],
        cancelledOrder: json["cancelledOrder"],
        deliveredOrder: json["deliveredOrder"],
        pendingToResponse: json["pendingToResponse"],
        orderInQueue: json["orderInQueue"],
        products: json["products"],
        totalAmount: json["totalAmount"],
        paid: json["paid"],
        due: json["due"],
      );
}
