import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/supplier.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/home/product_item.dart';
import 'package:dogventurehq/ui/screens/order_details/customer_info.dart';
import 'package:dogventurehq/ui/screens/order_details/details_con.dart';
import 'package:dogventurehq/ui/screens/order_details/driver_dialog.dart';
import 'package:dogventurehq/ui/screens/order_details/payment_info.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatefulWidget {
  static String routeName = '/order_details';
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderController _orderCon = Get.find<OrderController>();
  late SupplierModel _supplierInfo;
  final OrderModel oModel = Get.arguments;

  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    _orderCon.getDriverList(
      supplierID: _supplierInfo.supplierId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Order Details',
        noSuffixIcon: true,
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
                children: [
                  // customer details
                  DetailsCon(
                    title: 'Customer Details',
                    child: CustomerInfo(orderModel: oModel),
                  ),
                  // payment details
                  DetailsCon(
                    title: "Payment Details",
                    child: PaymentInfo(orderModel: oModel),
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
              oModel.invoiceDetailsViewModels.isEmpty
                  ? Center(
                      child: Text(
                        ConstantStrings.kNoData,
                      ),
                    )
                  : ListView.builder(
                      itemCount: oModel.invoiceDetailsViewModels.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(
                          index: index,
                          imgUrl: oModel
                              .invoiceDetailsViewModels[index].fileLocation,
                          productName: oModel
                              .invoiceDetailsViewModels[index].productName,
                          productWeight:
                              oModel.invoiceDetailsViewModels[index].subSku,
                          productPrice:
                              oModel.invoiceDetailsViewModels[index].price,
                          suffixWidget: Text(
                            'Qty (Pics):  ${oModel.invoiceDetailsViewModels[index].quantity}',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
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
                      suffixTxt: oModel.totalAmount.toString(),
                    ),
                    _summaryItem(
                      prefixTxt: 'Service Charge',
                      suffixTxt: oModel.paymentViewModels.isEmpty
                          ? '0.0'
                          : (oModel.paymentViewModels[0].carryingCost +
                                  oModel.paymentViewModels[0].courierCharge)
                              .toString(),
                    ),
                    _summaryItem(
                      prefixTxt: 'Estimated VAT',
                      suffixTxt: '0.0',
                    ),
                    const Divider(thickness: 1),
                    _summaryItem(
                      prefixTxt: 'Total',
                      suffixTxt: _getTotalAmount(),
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
                  onPressedFn: () {
                    if (oModel.invoiceViewModels[0].invoiceStatusId ==
                        ConstantStrings.kDeliveredOrderID) {
                      Methods.showSnackbar(
                        msg: "Order already delivered!",
                      );
                      return;
                    }
                  },
                  btnTxt: 'Delivered',
                  btnSize: Size(177.w, 52.h),
                  txtColor: oModel.invoiceViewModels[0].invoiceStatusId ==
                          ConstantStrings.kDeliveredOrderID
                      ? Colors.grey.shade300
                      : null,
                  btnColor: oModel.invoiceViewModels[0].invoiceStatusId ==
                          ConstantStrings.kDeliveredOrderID
                      ? Colors.grey.shade500
                      : null,
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
                  onPressedFn: () => showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.r),
                      ),
                    ),
                    builder: (_) => DriverDialog(
                      orderModel: oModel,
                      oCon: _orderCon,
                    ),
                  ),
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

  String _getTotalAmount() {
    if (oModel.paymentViewModels.isEmpty) {
      return '0.0';
    }
    double totalAmount = oModel.totalAmount;
    totalAmount += oModel.paymentViewModels[0].carryingCost;
    totalAmount += oModel.paymentViewModels[0].courierCharge;
    return totalAmount.toString();
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
