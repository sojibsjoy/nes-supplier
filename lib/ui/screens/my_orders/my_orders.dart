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

  final List<int> _btnIds = [
    ConstantStrings.kCurrentOrderID,
    ConstantStrings.kNewOrderID,
    ConstantStrings.kProcessedOrderID,
    ConstantStrings.kDeliveredOrderID,
    ConstantStrings.kPreviousOrderID,
  ];
  int _selectedBtnIndex = 0;
  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    _orderCon.getCurrentOrders(
      invoiceStatusID: _btnIds[0],
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
      body: Column(
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
                      _orderCon.getCurrentOrders(
                        invoiceStatusID: _btnIds[index],
                        supplierID: _supplierInfo.supplierId,
                      );
                      setState(
                        () => _selectedBtnIndex = index,
                      );
                    },
                    btnTxt: _btnTxts[index],
                    btnSize: Size(140.w, 35.h),
                    txtSize: 12.sp,
                    btnBorderRadius: 10.r,
                    btnColor: _selectedBtnIndex == index ? null : Colors.white,
                    txtColor: _selectedBtnIndex == index ? null : Colors.black,
                  ),
                );
              },
            ),
          ),
          // order list
          Expanded(
            child: Obx(() {
              if (_orderCon.ordersLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_orderCon.orderList.isEmpty) {
                  return Center(
                    child: Text(
                      ConstantStrings.kNoData,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _orderCon.orderList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20.h),
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItem(
                        oModel: _orderCon.orderList[index],
                      );
                    },
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
