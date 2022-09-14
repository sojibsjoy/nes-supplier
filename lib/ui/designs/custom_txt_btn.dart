import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTxtBtn extends StatelessWidget {
  final VoidCallback onTapFn;
  final String text;
  double? txtSize;
  Color? txtClr;
  FontWeight? txtWeight;
  CustomTxtBtn({
    Key? key,
    required this.onTapFn,
    required this.text,
    this.txtSize,
    this.txtClr,
    this.txtWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapFn,
      child: Text(
        text,
        style: TextStyle(
          // decoration: TextDecoration.underline,
          fontSize: txtSize ?? 16.sp,
          color: txtClr ?? Colors.black,
          fontWeight: txtWeight,
        ),
      ),
    );
  }
}
