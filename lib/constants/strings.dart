class ConstantStrings {
  //SupplierId=10185 (Rezaul Islam)
  static String kBaseUrl = 'http://g3.okommerce.com/api/';
  static String kAPIVersion = 'v1/';
  static String kSupplierLogin = 'supplier-login';
  static String kProductsFilter = 'Products-filter';
  static String kGetOrderByStatusID = 'get-order-by-invoicestatusid';
  static String kUpdateSupplier = 'update-supplier';
  static String kDriverList = 'driver-list';
  static String kShippedToTheDriver = 'shipedToTheDriver';
  static String kWebHtml = 'web-html/Privacy-Policy/4';
  static String kUploadDP = 'upload-supplier-profile-picture';
  static String kCategories = 'ParentCategory/4';
  static String kBrands = 'Brands';
  static String kDashboard = 'supplier-dashboard?supplierId=';
  static String kUpdateOrderStatus = 'update-order-status';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kNoData = 'No Data Found!';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';

  // order status id
  static int kNewOrderID = 1;
  static int kShippedOrderID = 3;
  static int kDeliveredOrderID = 4;
  static int kReturnedOrderID = 5;
  static int kCancelledOrderID = 6;
  static int kFailedOrderID = 7;
  static int kSendToDeliveryAgentOrderID = 12;
  static int kSendTODeliveryCompanyOrderID = 13;
  static int kAcceptedOrderID = 14;
  static int kWarehouseOrderID = 15;
  static int kOnTheWayOrderID = 16;
  static int kRequestForReturnOrderID = 22;
  static int kCurrentOrderID = 24;
  static int kProcessedOrderID = 25;
  static int kPreviousOrderID = 27;
}
