import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/my_orders/order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  static String routeName = '/my_orders';
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final List<String> _btnTxts = [
    'Current Order',
    'New Order',
    'Processed Order',
    'Delivered Order',
    'Previous Order',
  ];
  int _selectedBtnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'My Orders',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // order btn list
            Container(
              height: 35.h,
              margin: EdgeInsets.only(left: 20.w, top: 20.h),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: CustomBtn(
                      onPressedFn: () {
                        setState(() => _selectedBtnIndex = index);
                      },
                      btnTxt: _btnTxts[index],
                      btnSize: Size(120.w, 35.h),
                      txtSize: 12.sp,
                      btnBorderRadius: 10.r,
                      btnColor:
                          _selectedBtnIndex == index ? null : Colors.white,
                      txtColor:
                          _selectedBtnIndex == index ? null : Colors.black,
                    ),
                  );
                },
              ),
            ),
            // order list
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 20.h),
              itemBuilder: (BuildContext context, int index) {
                return const OrderItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
