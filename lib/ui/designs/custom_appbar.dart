import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

PreferredSizeWidget customAppBar({
  VoidCallback? leadingFn,
  String? leadingIcon,
  Widget? titleWidget,
  String? titleTxt,
  VoidCallback? suffixFn,
  String? suffixIcon,
}) =>
    AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: leadingFn ?? () => Get.back(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: _svgIcon(
          leadingIcon ?? 'assets/svgs/back.svg',
        ),
      ),
      title: titleWidget ??
          Text(
            titleTxt ?? "Appbar",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: InkWell(
            onTap:
                suffixFn, // add navigate to notification screen as null safety
            child: _svgIcon(
              suffixIcon ?? 'assets/svgs/bell.svg',
              w: 20.w,
            ),
          ),
        ),
      ],
    );

Widget _svgIcon(
  String icon, {
  double? w,
}) =>
    Center(
      child: SvgPicture.asset(
        icon,
        width: w ?? 25.w,
        fit: BoxFit.fitWidth,
      ),
    );
