import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentInfo extends StatelessWidget {
  final OrderModel orderModel;
  const PaymentInfo({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        orderModel.paymentViewModels.isEmpty
            ? _buildPaymentRow(prefixTxt: 'Status', suffixTxt: 'Unknown')
            : _buildPaymentRow(
                prefixTxt: 'Status:',
                suffixTxt: orderModel.paymentViewModels[0].statusName,
                suffixClr:
                    orderModel.paymentViewModels[0].statusName.toLowerCase() ==
                            'paid'
                        ? Colors.green.shade500
                        : null,
                suffixIcon:
                    orderModel.paymentViewModels[0].statusName.toLowerCase() ==
                            'paid'
                        ? SvgPicture.asset(
                            'assets/svgs/check.svg',
                            height: 15.h,
                            fit: BoxFit.fitHeight,
                          )
                        : null,
              ),
        _buildDivider(),
        _buildPaymentRow(
          prefixTxt: 'Type:',
          suffixTxt: orderModel.paymentViewModels.isEmpty
              ? 'Unknown'
              : orderModel.paymentViewModels[0].methodName,
        ),
        _buildDivider(),
        _buildPaymentRow(
          prefixTxt: 'Total Amount:',
          suffixTxt: 'AED ${orderModel.totalAmount}',
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
