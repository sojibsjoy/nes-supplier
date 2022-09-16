import 'package:dogventurehq/ui/screens/home/product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  bool? noPadding;
  Widget? suffixWidget;
  ProductList({
    Key? key,
    this.noPadding,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      primary: false,
      shrinkWrap: true,
      padding: noPadding != null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 20.w),
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          suffixWidget: suffixWidget,
        );
      },
    );
  }
}
