import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(titleTxt: 'Notification', noSuffixIcon: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // addH(20.h),
              // Date
              // Text(
              //   'Today',
              //   style: TextStyle(
              //     fontSize: 20.sp,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(top: 20.h),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 75.h,
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // bell icon
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/bell.svg',
                              height: 20.h,
                              fit: BoxFit.fitHeight,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        addW(10.w),
                        // notification details
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lorem Ipsun Is Simply Dummy',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 250.w,
                              height: 26.h,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis aliquet interdum. Nullam.',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        addW(30.w),
                        Center(
                          child: Text(
                            '10 AM',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
