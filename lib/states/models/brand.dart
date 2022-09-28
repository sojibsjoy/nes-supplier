import 'dart:convert';

List<BrandModel> brandModelFromJson(String str) => List<BrandModel>.from(
      json.decode(str).map(
            (x) => BrandModel.fromJson(x),
          ),
    );

class BrandModel {
  BrandModel({
    required this.brandId,
    required this.title,
    required this.largeImage,
  });

  int brandId;
  String title;
  String largeImage;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brandId: json["brandId"],
        title: json["title"],
        largeImage: json["largeImage"] ?? '',
      );
}
