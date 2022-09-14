import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyOrdersScreen extends StatefulWidget {
  static String routeName = '/my_orders';
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final List<String> _btnTxts = [
    'Current Order',
    'New Order',
    'Processed Order',
    'Delivered Order',
    'Previous Order',
  ];
  int _selectedBtnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'My Orders',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // order btn list
            Container(
              height: 35.h,
              margin: EdgeInsets.only(left: 20.w, top: 20.h),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: CustomBtn(
                      onPressedFn: () {
                        setState(() => _selectedBtnIndex = index);
                      },
                      btnTxt: _btnTxts[index],
                      btnSize: Size(120.w, 35.h),
                      txtSize: 12.sp,
                      btnBorderRadius: 10.r,
                      btnColor:
                          _selectedBtnIndex == index ? null : Colors.white,
                      txtColor:
                          _selectedBtnIndex == index ? null : Colors.black,
                    ),
                  );
                },
              ),
            ),
            // order list
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 20.h),
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '#Sc124535',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Processing..',
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
                            'Sara Faris',
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
                            '117/5 Semon joyi, Ranipukur, Sagorpara, Rajshahi',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
