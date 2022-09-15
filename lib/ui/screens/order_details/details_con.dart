import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DetailsCon extends StatelessWidget {
  final String title;
  final Widget child;
  const DetailsCon({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(title),
        Container(
          width: 185.w,
          height: 130.h,
          margin: EdgeInsets.only(top: 10.h),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2),
              )
            ],
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _buildTitle(String txt) => Text(
        txt,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      );
}
