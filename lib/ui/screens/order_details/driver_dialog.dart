import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/models/driver.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/order_shipping.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/widgets/dialog_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForwardToDriverDialog extends StatefulWidget {
  final OrderModel orderModel;
  final OrderController oCon;
  const ForwardToDriverDialog({
    Key? key,
    required this.orderModel,
    required this.oCon,
  }) : super(key: key);

  @override
  State<ForwardToDriverDialog> createState() => _ForwardToDriverDialogState();
}

class _ForwardToDriverDialogState extends State<ForwardToDriverDialog> {
  final TextEditingController _noteCon = TextEditingController();
  DateTime _choosenDate = DateTime.now();
  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  bool _nextFlag = false;
  int _selectedDriverIndex = -1;
  DriverModel? _selectedDriver;

  @override
  void initState() {
    super.initState();
    widget.oCon.orderShippedLoading.listen((value) {
      if (!value && widget.oCon.orderShippingModel != null) {
        // print("hello");
        Get.back();
        Methods.showSnackbar(
          title: "Order Forwarded!",
          msg: "Order successfully forwarded to the driver.",
          icon: Icons.check_circle,
          position: SnackPosition.TOP,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630.h,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          DialogTitleBar(
            prefixOnTapFn: _nextFlag
                ? () => setState(
                      () => _nextFlag = false,
                    )
                : () => Get.back(),
            title: _nextFlag ? 'Forward to driver' : 'Driver List',
          ),
          addH(20.h),
          _nextFlag
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Selected Driver: ${_selectedDriver!.name}"),
                    addH(10.h),
                    Row(
                      children: [
                        const Text("Scheduled Shipment Date: "),
                        InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime.now().add(
                                const Duration(days: 30),
                              ),
                              onConfirm: (date) => setState(
                                () => _choosenDate = date,
                              ),
                              currentTime: _choosenDate,
                              locale: LocaleType.en,
                            );
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 35.h,
                            width: 200.w,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "${_choosenDate.day} ${_monthNames.elementAt(_choosenDate.month - 1)} ${_choosenDate.year}",
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 280.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: CustomField(
                        textCon: _noteCon,
                        hintText: 'Note',
                        maxLine: 5,
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: widget.oCon.driverList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        value: _selectedDriverIndex == index,
                        activeColor: Colors.red.shade900,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (flag) => setState(() {
                          if (flag!) {
                            _selectedDriverIndex = index;
                            _selectedDriver = widget.oCon.driverList[index];
                          } else {
                            _selectedDriverIndex = -1;
                            _selectedDriver = null;
                          }
                        }),
                        title: Text(
                          widget.oCon.driverList[index].name,
                        ),
                      );
                    },
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBtn(
                onPressedFn: _nextFlag
                    ? () {
                        OrderShippingModel oShippingModel = OrderShippingModel(
                            driverId: _selectedDriver!.driverId,
                            shipmentDate: _choosenDate,
                            note: _noteCon.text,
                            invoiceStatusId: widget.orderModel
                                .invoiceViewModels[0].invoiceStatusId,
                            driversOrderViewModels: [
                              DriversOrderViewModel(
                                invoiceId: widget
                                    .orderModel.invoiceViewModels[0].invoiceId,
                              ),
                            ]);
                        widget.oCon.forwardToDriver(
                          oShippedModel: oShippingModel,
                        );
                        // print(oShippingModel.toJson().toString());
                        // Get.back();
                      }
                    : () {
                        if (_selectedDriverIndex == -1) {
                          Methods.showSnackbar(
                            msg: "You must select a driver first!",
                          );
                          return;
                        }
                        setState(() => _nextFlag = true);
                      },
                btnTxt: _nextFlag ? 'Forward to driver' : 'Next',
                btnSize: Size(185.w, 50.h),
                btnColor: Colors.red.shade900,
              ),
              CustomBtn(
                onPressedFn: () => Get.back(),
                btnTxt: 'Cancel',
                btnSize: Size(185.w, 50.h),
                btnColor: Colors.white,
                btnBorderColor: Colors.red.shade900,
                txtColor: Colors.red.shade900,
              ),
            ],
          ),
          addH(15.h),
        ],
      ),
    );
  }
}
