import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.subTitle,
    required this.largeImage,
  });

  int categoryId;
  String name;
  String subTitle;
  String largeImage;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["categoryId"],
        name: json["name"],
        subTitle: json["subTitle"],
        largeImage: json["largeImage"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "name": name,
        "subTitle": subTitle,
        "largeImage": largeImage,
      };
}
