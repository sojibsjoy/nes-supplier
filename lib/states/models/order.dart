import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

class OrderModel {
  OrderModel({
    required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    required this.createdAt,
    required this.billingAddressViewModels,
    required this.shippingAddressViewModels,
    required this.invoiceViewModels,
    required this.paymentViewModels,
    required this.customerViewModel,
    required this.invoiceDetailsViewModels,
  });

  int invoiceMasterId;
  int customerId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  int paymentMethod;
  int paymentStatus;
  String status;
  DateTime createdAt;
  IngAddressViewModels billingAddressViewModels;
  IngAddressViewModels shippingAddressViewModels;
  List<InvoiceViewModel> invoiceViewModels;
  List<PaymentViewModel> paymentViewModels;
  CustomerViewModel customerViewModel;
  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        invoiceMasterId: json["invoiceMasterId"],
        customerId: json["customerId"],
        refNumber: json["refNumber"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        paymentMethod: json["paymentMethod"],
        paymentStatus: json["paymentStatus"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        billingAddressViewModels:
            IngAddressViewModels.fromJson(json["billingAddressViewModels"]),
        shippingAddressViewModels:
            IngAddressViewModels.fromJson(json["shippingAddressViewModels"]),
        invoiceViewModels: List<InvoiceViewModel>.from(
            json["invoiceViewModels"].map((x) => InvoiceViewModel.fromJson(x))),
        paymentViewModels: List<PaymentViewModel>.from(
            json["paymentViewModels"].map((x) => PaymentViewModel.fromJson(x))),
        customerViewModel:
            CustomerViewModel.fromJson(json["customerViewModel"]),
        invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(
            json["invoiceDetailsViewModels"]
                .map((x) => InvoiceDetailsViewModel.fromJson(x))),
      );
}

class IngAddressViewModels {
  IngAddressViewModels({
    required this.billingShippingAddressId,
    required this.invoiceMasterId,
    required this.customerAddressId,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.stateName,
    required this.cityName,
    required this.countryName,
    required this.addressLine,
    required this.addressLine2,
    required this.deleveryTime,
    required this.isBilingAddress,
    required this.isShippingAddress,
  });

  int billingShippingAddressId;
  int invoiceMasterId;
  int customerAddressId;
  int countryId;
  int stateId;
  int cityId;
  String stateName;
  String cityName;
  String countryName;
  String addressLine;
  String addressLine2;
  String deleveryTime;
  bool isBilingAddress;
  bool isShippingAddress;

  factory IngAddressViewModels.fromJson(Map<String, dynamic> json) =>
      IngAddressViewModels(
        billingShippingAddressId: json["billingShippingAddressId"],
        invoiceMasterId: json["invoiceMasterId"] ?? 0,
        customerAddressId: json["customerAddressId"],
        countryId: json["countryId"] ?? 0,
        stateId: json["stateId"] ?? 0,
        cityId: json["cityId"] ?? 0,
        stateName: json["stateName"] ?? '',
        cityName: json["cityName"] ?? '',
        countryName: json["countryName"] ?? '',
        addressLine: json["addressLine"] ?? '',
        addressLine2: json["addressLine2"] ?? '',
        deleveryTime: json["deleveryTime"] ?? '',
        isBilingAddress: json["isBilingAddress"] ?? false,
        isShippingAddress: json["isShippingAddress"] ?? false,
      );
}

class PaymentViewModel {
  PaymentViewModel({
    required this.paymentId,
    required this.invoiceMasterId,
    required this.amount,
    required this.courierCharge,
    required this.discountAmount,
    required this.carryingCost,
    required this.payDate,
    required this.createdAt,
    required this.methodName,
    required this.statusName,
    required this.currencyViewModel,
  });

  int paymentId;
  int invoiceMasterId;
  double amount;
  double courierCharge;
  double discountAmount;
  double carryingCost;
  DateTime payDate;
  DateTime createdAt;
  String methodName;
  String statusName;
  CurrencyViewModel currencyViewModel;

  factory PaymentViewModel.fromJson(Map<String, dynamic> json) =>
      PaymentViewModel(
        paymentId: json["paymentId"],
        invoiceMasterId: json["invoiceMasterId"],
        amount: json["amount"],
        courierCharge: json["courierCharge"],
        discountAmount: json["discountAmount"],
        carryingCost: json["carryingCost"],
        payDate: DateTime.parse(json["payDate"] ?? ''),
        createdAt: DateTime.parse(json["createdAt"] ?? ''),
        methodName: json["methodName"],
        statusName: json["statusName"] ?? '',
        currencyViewModel:
            CurrencyViewModel.fromJson(json["currencyViewModel"] ?? ''),
      );
}

class CurrencyViewModel {
  CurrencyViewModel({
    required this.currencyId,
    required this.code,
    required this.symbol,
  });

  int currencyId;
  String code;
  String symbol;

  factory CurrencyViewModel.fromJson(Map<String, dynamic> json) =>
      CurrencyViewModel(
        currencyId: json["currencyId"],
        code: json["code"],
        symbol: json["symbol"],
      );
}

class CustomerViewModel {
  CustomerViewModel({
    required this.customerId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.customerGroupId,
    required this.firstLastName,
  });

  int customerId;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String phoneNo;
  int customerGroupId;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerViewModel(
        customerId: json["customerId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        customerGroupId: json["customerGroupId"],
        firstLastName: json["firstLastName"],
      );
}

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    required this.invoiceDetailsId,
    required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    required this.status,
    required this.productTypeId,
    required this.supplierName,
    required this.supplierMobile,
    required this.productName,
    required this.productSkuId,
    required this.subSku,
    required this.largeImage,
    required this.mediumImage,
    required this.fileLocation,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  double quantity;
  double price;
  String status;
  int productTypeId;
  String supplierName;
  String supplierMobile;
  String productName;
  int productSkuId;
  String subSku;
  String largeImage;
  String mediumImage;
  String fileLocation;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsViewModel(
        invoiceDetailsId: json["invoiceDetailsId"],
        invoiceId: json["invoiceId"],
        productMasterId: json["productMasterId"],
        quantity: json["quantity"],
        price: json["price"],
        status: json["status"],
        productTypeId: json["productTypeId"],
        supplierName: json["supplierName"],
        supplierMobile: json["supplierMobile"],
        productName: json["productName"],
        productSkuId: json["productSkuId"],
        subSku: json["subSku"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
        fileLocation: json["fileLocation"],
      );
}

class InvoiceViewModel {
  InvoiceViewModel({
    required this.invoiceId,
    required this.invoiceMasterId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.supplierId,
    required this.storeId,
    required this.status,
    required this.amountToSupplier,
    required this.amountToAdmin,
    required this.totalProduct,
    required this.supplierName,
    required this.supplierMobile,
    required this.supplierEmail,
  });

  int invoiceId;
  int invoiceMasterId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  int supplierId;
  int storeId;
  String status;
  double amountToSupplier;
  double amountToAdmin;
  int totalProduct;
  String supplierName;
  String supplierMobile;
  String supplierEmail;

  factory InvoiceViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceViewModel(
        invoiceId: json["invoiceId"],
        invoiceMasterId: json["invoiceMasterId"],
        refNumber: json["refNumber"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        supplierId: json["supplierId"],
        storeId: json["storeId"],
        status: json["status"],
        amountToSupplier: json["amountToSupplier"].toDouble(),
        amountToAdmin: json["amountToAdmin"].toDouble(),
        totalProduct: json["totalProduct"],
        supplierName: json["supplierName"],
        supplierMobile: json["supplierMobile"],
        supplierEmail: json["supplierEmail"],
      );
}
