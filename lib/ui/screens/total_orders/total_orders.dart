import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/product_list.dart';
import 'package:flutter/material.dart';

class TotalOrdersScreen extends StatelessWidget {
  static String routeName = '/total_orders';
  const TotalOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        titleTxt: 'Total Orders',
        noSuffixIcon: true,
      ),
      // body: Padding(
      //   padding: EdgeInsets.only(top: 10.h),
      //   child: ProductList(),
      // ),
    );
  }
}
