import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    required this.supplierId,
    required this.productListRequestModels,
  });

  int supplierId;
  List<ProductListRequestModel> productListRequestModels;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        supplierId: json["supplierId"],
        productListRequestModels: List<ProductListRequestModel>.from(
            json["productListRequestModels"]
                .map((x) => ProductListRequestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "supplierId": supplierId,
        "productListRequestModels":
            List<dynamic>.from(productListRequestModels.map((x) => x.toJson())),
      };
}

class ProductListRequestModel {
  ProductListRequestModel({
    required this.productMasterId,
    required this.productName,
    required this.productTypeId,
    required this.productDecimal,
    required this.totalRating,
    required this.totalReview,
    required this.storeId,
    required this.supplierId,
    required this.isWished,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    required this.guidId,
    required this.productMasterMediaViewModels,
    required this.productSubSkuRequestModels,
    required this.productType,
  });

  int productMasterId;
  String productName;
  int productTypeId;
  double productDecimal;
  double totalRating;
  double totalReview;
  int storeId;
  int supplierId;
  bool isWished;
  String urlKey;
  String metaTitle;
  String metaKeyword;
  String metaDesceiption;
  String guidId;
  List<ProductMasterMediaViewModel> productMasterMediaViewModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;
  dynamic productType;

  factory ProductListRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductListRequestModel(
        productMasterId: json["productMasterId"],
        productName: json["productName"],
        productTypeId: json["productTypeId"],
        productDecimal: json["productDecimal"],
        totalRating: json["totalRating"],
        totalReview: json["totalReview"],
        storeId: json["storeId"],
        supplierId: json["supplierId"],
        isWished: json["isWished"],
        urlKey: json["urlKey"],
        metaTitle: json["metaTitle"],
        metaKeyword: json["metaKeyword"],
        metaDesceiption: json["metaDesceiption"],
        guidId: json["guidId"],
        productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(
            json["productMasterMediaViewModels"]
                .map((x) => ProductMasterMediaViewModel.fromJson(x))),
        productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(
            json["productSubSkuRequestModels"]
                .map((x) => ProductSubSkuRequestModel.fromJson(x))),
        productType: json["productType"],
      );

  Map<String, dynamic> toJson() => {
        "productMasterId": productMasterId,
        "productName": productName,
        "productTypeId": productTypeId,
        "productDecimal": productDecimal,
        "totalRating": totalRating,
        "totalReview": totalReview,
        "storeId": storeId,
        "supplierId": supplierId,
        "isWished": isWished,
        "urlKey": urlKey,
        "metaTitle": metaTitle,
        "metaKeyword": metaKeyword,
        "metaDesceiption": metaDesceiption,
        "guidId": guidId,
        "productMasterMediaViewModels": List<dynamic>.from(
            productMasterMediaViewModels.map((x) => x.toJson())),
        "productSubSkuRequestModels": List<dynamic>.from(
            productSubSkuRequestModels.map((x) => x.toJson())),
        "productType": productType,
      };
}

class ProductMasterMediaViewModel {
  ProductMasterMediaViewModel({
    required this.productMasterMediaId,
    required this.productMasterId,
    required this.fileType,
    required this.fileName,
    required this.fileLocation,
    required this.videoEmbade,
    required this.fileKey,
    required this.isFeatureImage,
    required this.mediumImage,
    required this.smallImage,
    required this.productSubSkuId,
  });

  int productMasterMediaId;
  int productMasterId;
  String fileType;
  String fileName;
  String fileLocation;
  String videoEmbade;
  String fileKey;
  bool isFeatureImage;
  dynamic mediumImage;
  dynamic smallImage;
  dynamic productSubSkuId;

  factory ProductMasterMediaViewModel.fromJson(Map<String, dynamic> json) =>
      ProductMasterMediaViewModel(
        productMasterMediaId: json["productMasterMediaId"],
        productMasterId: json["productMasterId"],
        fileType: json["fileType"],
        fileName: json["fileName"],
        fileLocation: json["fileLocation"],
        videoEmbade: json["videoEmbade"],
        fileKey: json["fileKey"],
        isFeatureImage: json["isFeatureImage"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
        productSubSkuId: json["productSubSKUId"],
      );

  Map<String, dynamic> toJson() => {
        "productMasterMediaId": productMasterMediaId,
        "productMasterId": productMasterId,
        "fileType": fileType,
        "fileName": fileName,
        "fileLocation": fileLocation,
        "videoEmbade": videoEmbade,
        "fileKey": fileKey,
        "isFeatureImage": isFeatureImage,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
        "productSubSKUId": productSubSkuId,
      };
}

class ProductSubSkuRequestModel {
  ProductSubSkuRequestModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.storeId,
    required this.subSku,
    required this.previousPrice,
    required this.price,
    required this.quantity,
    required this.attributeCombination,
    required this.attributeSetId,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.symbol,
  });

  int productSubSkuId;
  int productMasterId;
  int storeId;
  String subSku;
  double previousPrice;
  double price;
  double quantity;
  String attributeCombination;
  int attributeSetId;
  String largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  String symbol;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuRequestModel(
        productSubSkuId: json["productSubSKUId"],
        productMasterId: json["productMasterId"],
        storeId: json["storeId"],
        subSku: json["subSKU"],
        previousPrice: json["previousPrice"] ?? 0,
        price: json["price"],
        quantity: json["quantity"],
        attributeCombination: json["attributeCombination"],
        attributeSetId: json["attributeSetId"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
        videoEmbade: json["videoEmbade"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "productSubSKUId": productSubSkuId,
        "productMasterId": productMasterId,
        "storeId": storeId,
        "subSKU": subSku,
        "previousPrice": previousPrice,
        "price": price,
        "quantity": quantity,
        "attributeCombination": attributeCombination,
        "attributeSetId": attributeSetId,
        "largeImage": largeImage,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
        "videoEmbade": videoEmbade,
        "symbol": symbol,
      };
}
