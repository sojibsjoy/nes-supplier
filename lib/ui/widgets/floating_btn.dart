import 'package:dogventurehq/ui/widgets/nav_icon.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3,
          color: Colors.red.shade900,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: NavIcon(
          onTapFn: () => Get.toNamed(
            MyOrdersScreen.routeName,
          ),
          icon: 'order',
          iconClr: Colors.black,
          iconSize: 25.h,
        ),
      ),
    );
  }
}
