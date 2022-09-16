import 'package:dogventurehq/ui/screens/profile/summary_con.dart';
import 'package:dogventurehq/ui/widgets/floating_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class CustomMenuItem extends StatelessWidget {
  VoidCallback? onTapFn;
  final String icon;
  final String title;
  String? suffixTxt;
  Widget? suffixWidget;
  bool? noDividerFlag;
  CustomMenuItem({
    Key? key,
    this.onTapFn,
    required this.icon,
    required this.title,
    this.suffixTxt,
    this.suffixWidget,
    this.noDividerFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapFn,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 8.h,
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/$icon.svg',
                      width: 15.h,
                      color: Colors.red.shade900,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                addW(10.w),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                if (suffixTxt != null)
                  Text(
                    suffixTxt!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (suffixWidget != null) suffixWidget!,
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        if (noDividerFlag == null)
          Divider(
            indent: 80.w,
            endIndent: 40.w,
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
          ),
      ],
    );
  }
}
