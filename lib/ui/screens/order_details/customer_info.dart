import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerInfo extends StatelessWidget {
  final OrderModel orderModel;
  const CustomerInfo({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // customer name
        Text(
          orderModel.customerViewModel.firstLastName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        addH(10.h),
        // customer address
        _buildRowTxt(
          icon: 'location',
          txt: orderModel.billingAddressViewModels.addressLine,
        ),
        addH(10.h),
        // customer contact number
        _buildRowTxt(
          icon: 'call',
          txt: orderModel.customerViewModel.phoneNo,
        ),
        addH(10.h),
        // invoice number
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Invoice Number: ',
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
            Text(
              orderModel.invoiceViewModels.isEmpty
                  ? ''
                  : '#${orderModel.invoiceViewModels[0].refNumber}',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowTxt({
    required String icon,
    required String txt,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svgs/$icon.svg',
            height: 15.h,
            fit: BoxFit.fitHeight,
          ),
          addW(5.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
        ],
      );
}
