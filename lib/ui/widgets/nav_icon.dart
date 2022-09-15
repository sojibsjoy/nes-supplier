import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavIcon extends StatelessWidget {
  final VoidCallback onTapFn;
  final String icon;
  String? title;
  Color? iconClr;
  double? iconSize;
  NavIcon({
    Key? key,
    required this.onTapFn,
    required this.icon,
    this.title,
    this.iconClr,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTapFn,
      child: SizedBox(
        width: 60.w,
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/svgs/$icon.svg',
              height: iconSize,
              fit: BoxFit.fitHeight,
              color: iconClr,
            ),
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 12.sp,
                ),
              )
          ],
        ),
      ),
    );
  }
}
