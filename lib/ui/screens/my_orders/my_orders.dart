import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/supplier.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/my_orders/order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatefulWidget {
  static String routeName = '/my_orders';
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final OrderController _orderCon = Get.find<OrderController>();
  late SupplierModel _supplierInfo;
  final List<String> _btnTxts = [
    'Current Order',
    'New Order',
    'Processed Order',
    'Delivered Order',
    'Previous Order',
  ];
  int _selectedBtnIndex = 0;
  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    _orderCon.getCurrentOrders(
      supplierID: _supplierInfo.supplierId,
    );
    super.initState();
  }

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
                    padding: EdgeInsets.only(right: 10.w),
                    child: CustomBtn(
                      onPressedFn: () {
                        setState(
                          () => _selectedBtnIndex = index,
                        );
                      },
                      btnTxt: _btnTxts[index],
                      btnSize: Size(140.w, 35.h),
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
            Obx(() {
              if (_orderCon.currentOrdersLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_orderCon.currentOrders.isEmpty) {
                  return Center(
                    child: Text(
                      ConstantStrings.kNoData,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _orderCon.currentOrders.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(top: 20.h),
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItem(
                        oModel: _orderCon.currentOrders[index],
                      );
                    },
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
