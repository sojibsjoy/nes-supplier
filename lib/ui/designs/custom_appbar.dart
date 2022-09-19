import 'package:dogventurehq/ui/screens/notification/notification.dart';
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
  bool? noSuffixIcon,
}) =>
    AppBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
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
        if (noSuffixIcon == null)
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: suffixFn ??
                  () => Get.toNamed(
                        NotificationScreen.routeName,
                      ),
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
