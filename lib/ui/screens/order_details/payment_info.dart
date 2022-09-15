import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPaymentRow(
          prefixTxt: 'Status:',
          suffixTxt: 'Paid',
          suffixClr: Colors.green.shade500,
          suffixIcon: SvgPicture.asset(
            'assets/svgs/check.svg',
            height: 15.h,
            fit: BoxFit.fitHeight,
          ),
        ),
        _buildDivider(),
        _buildPaymentRow(
          prefixTxt: 'Type:',
          suffixTxt: 'Online Payment',
        ),
        _buildDivider(),
        _buildPaymentRow(
          prefixTxt: 'Total Amount:',
          suffixTxt: 'AED 23,550',
        ),
      ],
    );
  }

  Widget _buildDivider() => Divider(
        thickness: 1,
        color: Colors.grey.withOpacity(0.2),
      );

  Widget _buildPaymentRow({
    required String prefixTxt,
    required String suffixTxt,
    Color? suffixClr,
    Widget? suffixIcon,
  }) =>
      Row(
        children: [
          Text(
            prefixTxt,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          addW(5.w),
          Text(
            suffixTxt,
            style: TextStyle(
              color: suffixClr,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          if (suffixIcon != null) suffixIcon
        ],
      );
}
