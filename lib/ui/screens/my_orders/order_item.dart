import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/ui/screens/order_details/order_details.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class OrderItem extends StatelessWidget {
  final OrderModel oModel;
  const OrderItem({
    Key? key,
    required this.oModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        OrderDetails.routeName,
        arguments: oModel,
      ),
      child: Container(
        width: 388.w,
        height: 95.h,
        margin: EdgeInsets.only(
          bottom: 10.h,
          left: 20.w,
          right: 20.w,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10.w,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Invoice Number: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  oModel.invoiceViewModels.isEmpty
                      ? ''
                      : '#${oModel.invoiceViewModels[0].refNumber}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                Text(
                  oModel.status,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'From: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  oModel.customerViewModel.firstLastName,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            addH(2.h),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/location.svg',
                  height: 15.h,
                  fit: BoxFit.fitHeight,
                ),
                addW(5.w),
                Text(
                  oModel.billingAddressViewModels.addressLine,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
