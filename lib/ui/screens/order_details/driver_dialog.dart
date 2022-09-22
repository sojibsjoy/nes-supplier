import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/models/driver.dart';
import 'package:dogventurehq/states/models/order_shipping.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/widgets/dialog_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DriverDialog extends StatefulWidget {
  final OrderController oCon;
  const DriverDialog({
    Key? key,
    required this.oCon,
  }) : super(key: key);

  @override
  State<DriverDialog> createState() => _DriverDialogState();
}

class _DriverDialogState extends State<DriverDialog> {
  final TextEditingController _noteCon = TextEditingController();
  bool _nextFlag = false;
  int _selectedDriverIndex = -1;
  DriverModel? _selectedDriver;
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
                    Container(
                      height: 300.h,
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
                        // OrderShippingModel oShippingModel = OrderShippingModel(
                        //   driverShipmentId: _selectedDriver. ,
                        //   driverId: driverId,
                        //   shipmentDate: shipmentDate,
                        //   note: note,
                        //   createdAt: createdAt,
                        //   createBy: createBy,
                        //   invoiceStatusId: invoiceStatusId,
                        //   driversOrderViewModels: driversOrderViewModels,
                        // );
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
