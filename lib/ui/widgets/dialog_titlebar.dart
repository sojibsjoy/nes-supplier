import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DialogTitleBar extends StatelessWidget {
  final VoidCallback prefixOnTapFn;
  final String title;
  Widget? suffixWidget;
  DialogTitleBar({
    Key? key,
    required this.prefixOnTapFn,
    required this.title,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: prefixOnTapFn,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/back.svg',
              width: 25.w,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
          ),
        ),
        const Spacer(),
        if (suffixWidget != null) suffixWidget!,
      ],
    );
  }
}
