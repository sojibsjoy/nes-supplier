import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCon extends StatelessWidget {
  final String icon;
  final String title;
  final String amount;
  Color? iconBg;
  Color? brdrClr;
  HomeCon({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    this.iconBg,
    this.brdrClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 95.h,
      decoration: BoxDecoration(
        border: Border.all(color: brdrClr ?? Colors.red),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // icon
          Container(
            width: 35.w,
            height: 35.h,
            margin: EdgeInsets.only(bottom: 5.h, top: 5),
            decoration: BoxDecoration(
              color: iconBg ?? Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/$icon.svg',
              ),
            ),
          ),
          // title
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
