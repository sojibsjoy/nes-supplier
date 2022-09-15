import 'package:dogventurehq/ui/screens/profile/summary_con.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SummaryCon extends StatelessWidget {
  final String icon;
  final String title;
  final String amount;
  Color? iconBg;
  SummaryCon({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    this.iconBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.w,
      height: 65.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              color: iconBg ?? Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/$icon.svg',
                height: 15.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          addW(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'AED $amount',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
