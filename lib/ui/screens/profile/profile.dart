import 'package:dogventurehq/ui/screens/profile/summary_con.dart';
import 'package:dogventurehq/ui/widgets/floating_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _acceptingOrdersFlag = false;
  bool _enableOTPFlag = false;
  bool _notificationFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(183, 28, 28, 1),
        child: Column(
          children: [
            // tob banner view
            SizedBox(
              height: 305.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // profile bg img
                  Image.asset(
                    'assets/imgs/profile_bg.png',
                    height: 305.h,
                    fit: BoxFit.fitHeight,
                  ),
                  // back btn
                  Positioned(
                    top: 55.h,
                    left: 20.h,
                    child: InkWell(
                      onTap: () => Get.back(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: SvgPicture.asset(
                        'assets/svgs/back.svg',
                        height: 20.h,
                        color: Colors.white,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // user dp
                      SizedBox(
                        width: 115.w,
                        height: 115.h,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            // user image
                            Container(
                              width: 115.w,
                              height: 115.h,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            // photo uploading btn
                            InkWell(
                              onTap: () => print('photo upload btn pressed...'),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 26.w,
                                height: 26.h,
                                margin: EdgeInsets.only(
                                  bottom: 5.h,
                                  right: 5.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red.shade900,
                                    width: 2,
                                  ),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svgs/camera.svg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addH(10.h),
                      // user name
                      Text(
                        'Md. Sojib Sarker',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      addH(5.h),
                      // location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/location.svg',
                            height: 12.h,
                            color: Colors.white,
                            fit: BoxFit.fitHeight,
                          ),
                          addW(5.w),
                          Text(
                            'Dubai, UAE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // body view
            Container(
              width: double.infinity,
              height: 550.1.h,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              child: Column(
                children: [
                  // profile items
                  _buildMenuItem(
                    icon: 'person',
                    title: 'Name',
                    suffixTxt: 'Md. Sojib Sarker',
                  ),
                  _buildMenuItem(
                    icon: 'email',
                    title: 'Email',
                    suffixTxt: 'sojib.vu@gmail.com',
                  ),
                  _buildMenuItem(
                    icon: 'phone',
                    title: 'Mobile',
                    suffixTxt: '+880 1716 589947',
                  ),
                  _buildMenuItem(
                    icon: 'accepting_order',
                    title: 'Accepting Orders',
                    suffixWidget: FlutterSwitch(
                      width: 50.w,
                      height: 30.h,
                      toggleSize: 20.0,
                      activeColor: Colors.red.shade900,
                      value: _acceptingOrdersFlag,
                      borderRadius: 30.0,
                      onToggle: (value) => setState(
                        () => _acceptingOrdersFlag = value,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    icon: 'otp',
                    title: 'Enable OTP',
                    suffixWidget: FlutterSwitch(
                      width: 50.w,
                      height: 30.h,
                      toggleSize: 20.0,
                      activeColor: Colors.red.shade900,
                      value: _enableOTPFlag,
                      borderRadius: 30.0,
                      onToggle: (value) => setState(
                        () => _enableOTPFlag = value,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    icon: 'bell',
                    title: 'Receive Notifications via Email',
                    suffixWidget: FlutterSwitch(
                      width: 50.w,
                      height: 30.h,
                      toggleSize: 20.0,
                      activeColor: Colors.red.shade900,
                      value: _notificationFlag,
                      borderRadius: 30.0,
                      onToggle: (value) => setState(
                        () => _notificationFlag = value,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    icon: 'location',
                    title: 'Address',
                    suffixWidget: Icon(
                      Icons.arrow_forward_ios,
                      size: 20.h,
                    ),
                    noDividerFlag: true,
                  ),
                  addH(30.h),
                  // total earn & earn this month
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SummaryCon(
                        icon: 'cash',
                        title: 'Total Earn',
                        amount: '8,200',
                      ),
                      SummaryCon(
                        icon: 'money',
                        title: 'Earn This Month',
                        amount: '1,500',
                        iconBg: Colors.red.shade900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingBtn(),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget _buildMenuItem({
    VoidCallback? onTapFn,
    required String icon,
    required String title,
    String? suffixTxt,
    Widget? suffixWidget,
    bool? noDividerFlag,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTapFn,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 8.h,
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/$icon.svg',
                      width: 15.h,
                      color: Colors.red.shade900,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                addW(10.w),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                if (suffixTxt != null)
                  Text(
                    suffixTxt,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (suffixWidget != null) suffixWidget,
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        if (noDividerFlag == null)
          Divider(
            indent: 80.w,
            endIndent: 40.w,
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
          ),
      ],
    );
  }
}