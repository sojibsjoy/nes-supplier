import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/order_details/customer_info.dart';
import 'package:dogventurehq/ui/screens/order_details/details_con.dart';
import 'package:dogventurehq/ui/screens/order_details/payment_info.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/product_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  static String routeName = '/order_details';
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Order Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addH(20.h),
              // customer and payment details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // customer details
                  DetailsCon(
                    title: 'Customer Details',
                    child: CustomerInfo(),
                  ),
                  // payment details
                  DetailsCon(
                    title: "Payment Details",
                    child: PaymentInfo(),
                  ),
                ],
              ),
              addH(20.h),
              // total orders title & view all btn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle('Total Orders'),
                  CustomTxtBtn(
                    onTapFn: () => Get.toNamed(
                      ProductsScreen.routeName,
                    ),
                    text: 'View all',
                    txtSize: 12.sp,
                    txtClr: Colors.red.shade900,
                  ),
                ],
              ),
              // Order List
              ProductList(
                noPadding: true,
                suffixWidget: Text(
                  'Qty (Pics): 500',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              addH(10.h),
              // divider
              const Divider(thickness: 1),
              addH(10.h),
              // order summary
              _buildTitle('Order Summary'),
              Container(
                width: 388.w,
                height: 155.h,
                margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _summaryItem(
                      prefixTxt: 'Sub Total',
                      suffixTxt: '23,350',
                    ),
                    _summaryItem(
                      prefixTxt: 'Service Charge',
                      suffixTxt: '100',
                    ),
                    _summaryItem(
                      prefixTxt: 'Estimated VAT',
                      suffixTxt: '100',
                    ),
                    const Divider(thickness: 1),
                    _summaryItem(
                      prefixTxt: 'Total',
                      suffixTxt: '23,550',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 180.h,
        padding: const EdgeInsets.all(15),
        color: Colors.blue.withOpacity(0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Deliverd',
                  btnSize: Size(177.w, 52.h),
                ),
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Check complaints',
                  btnSize: Size(177.w, 52.h),
                  btnColor: Colors.white,
                  txtColor: Colors.red.shade900,
                  btnBorderColor: Colors.red.shade900,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Forward to driver',
                  btnSize: Size(177.w, 52.h),
                  btnColor: Colors.red.shade900,
                ),
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Call help center',
                  btnSize: Size(177.w, 52.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem({
    required String prefixTxt,
    required String suffixTxt,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            prefixTxt,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          const Spacer(),
          Text(
            'AED',
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
          addW(3.w),
          Text(
            suffixTxt,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );

  Widget _buildTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      );
}
