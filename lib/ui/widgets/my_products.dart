import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProducts extends StatelessWidget {
  Widget? suffixWidget;
  MyProducts({
    Key? key,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        addW(20.w),
        Text(
          'My Products',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        CustomBtn(
          onPressedFn: () {},
          btnTxt: '+  Add new product',
          btnSize: Size(120.w, 32.h),
          txtSize: 10.sp,
          btnBorderRadius: 10.r,
        ),
        if (suffixWidget != null) suffixWidget!,
        addW(10.w),
      ],
    );
  }
}
