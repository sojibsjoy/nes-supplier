import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/supplier.dart';
import 'package:dogventurehq/ui/screens/my_orders/order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalOrdersScreen extends StatefulWidget {
  static String routeName = '/total_orders';
  const TotalOrdersScreen({Key? key}) : super(key: key);

  @override
  State<TotalOrdersScreen> createState() => _TotalOrdersScreenState();
}

class _TotalOrdersScreenState extends State<TotalOrdersScreen> {
  final OrderController _oCon = Get.find<OrderController>();

  late SupplierModel _supplierInfo;

  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    _oCon.getOrders(supplierID: _supplierInfo.supplierId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        titleTxt: 'Total Orders',
        noSuffixIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Obx(() {
          if (_oCon.ordersLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (_oCon.orderList.isEmpty) {
              return Center(
                child: Text(
                  ConstantStrings.kNoData,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: _oCon.orderList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20.h),
                itemBuilder: (BuildContext context, int index) {
                  return OrderItem(
                    oModel: _oCon.orderList[index],
                  );
                },
              );
            }
          }
        }),
      ),
    );
  }
}
