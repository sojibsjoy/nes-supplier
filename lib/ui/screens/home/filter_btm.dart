import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FilterBtm extends StatelessWidget {
  final VoidCallback onTapFn;
  String? btnTitle;
  FilterBtm({
    Key? key,
    required this.onTapFn,
    this.btnTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomBtn(
          onPressedFn: onTapFn,
          btnTxt: btnTitle ?? 'Apply',
          btnSize: Size(185.w, 50.h),
        ),
        CustomBtn(
          onPressedFn: () => Get.back(),
          btnTxt: 'Cancel',
          btnSize: Size(185.w, 50.h),
          btnColor: Colors.white,
          btnBorderColor: Colors.red.shade900,
          txtColor: Colors.red.shade900,
        ),
      ],
    );
  }
}
