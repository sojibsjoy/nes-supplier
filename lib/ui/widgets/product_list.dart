import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/ui/screens/home/product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  List<ProductListRequestModel> productsList;
  bool? noPadding;
  Widget? suffixWidget;
  ProductList({
    Key? key,
    required this.productsList,
    this.noPadding,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsList.length,
      primary: false,
      shrinkWrap: true,
      padding: noPadding != null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 20.w),
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: productsList[index].productName,
          child: ProductItem(
            index: index,
            imgUrl: productsList[index]
                .productMasterMediaViewModels[0]
                .fileLocation,
            productName: productsList[index].productName,
            productWeight:
                productsList[index].productSubSkuRequestModels[0].subSku,
            productPrice:
                productsList[index].productSubSkuRequestModels[0].price,
            suffixWidget: suffixWidget,
          ),
        );
      },
    );
  }
}
