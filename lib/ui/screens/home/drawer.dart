import 'package:dogventurehq/ui/designs/menu_item.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:dogventurehq/ui/screens/notification/notification.dart';
import 'package:dogventurehq/ui/screens/privacy_policy/privacy_policy.dart';
import 'package:dogventurehq/ui/screens/profile/profile.dart';
import 'package:dogventurehq/ui/screens/total_orders/total_orders.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  final List<String> _menuIcons = [
    'home',
    'order',
    'total_order',
    'bell',
    'person',
    'privacy',
    'logout',
  ];
  final List<String> _menuTitle = [
    'Home',
    'My Orders',
    'Total Orders',
    'Notifications',
    'My Profile',
    'Privacy Policy',
    'Log Out',
  ];
  final List<VoidCallback> _menuOnTapFns = [
    // section 1
    () => Get.back(),
    () => Get.toNamed(MyOrdersScreen.routeName),
    () => Get.toNamed(TotalOrdersScreen.routeName),
    () => Get.toNamed(NotificationScreen.routeName),
    () => Get.toNamed(ProfileScreen.routeName),
    () => Get.toNamed(PrivacyPolicyScreen.routeName),
    () => print('Log out'),
    // () => AwesomeDialog(
    //       context: Get.context!,
    //       dialogType: DialogType.WARNING,
    //       animType: AnimType.BOTTOMSLIDE,
    //       title: 'Log Out',
    //       desc: 'Are you sure want to log out?',
    //       btnCancelOnPress: () {},
    //       btnOkOnPress: () {
    //         Get.offAllNamed(LoginScreen.routeName);
    //         Preference.logOut();
    //       },
    //     ).show(),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(183, 28, 28, 1),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tob banner view
          SizedBox(
            width: double.infinity,
            height: 200.h,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                // profile bg img
                Image.asset(
                  'assets/imgs/profile_bg.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                // user details
                Container(
                  width: 340.w,
                  height: 80.h,
                  margin: EdgeInsets.only(top: 65.h, left: 31.w),
                  child: Row(
                    children: [
                      // user dp
                      ClipOval(
                        child: Image.asset(
                          'assets/imgs/user.png',
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      addW(10.h),
                      // user details
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            children: [
                              // location icon
                              SvgPicture.asset(
                                'assets/svgs/location.svg',
                                height: 12.h,
                                color: Colors.white,
                                fit: BoxFit.fitHeight,
                              ),
                              addW(5.w),
                              // location details
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
                // cross icon
                Positioned(
                  top: 58.h,
                  right: 25.w,
                  child: InkWell(
                    onTap: () => Get.back(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // body view
          Container(
            width: double.infinity,
            height: 726.h,
            padding: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/imgs/shadow_logo.png',
                    height: 250.h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  children: [
                    ListView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomMenuItem(
                          onTapFn: _menuOnTapFns[index],
                          icon: _menuIcons[index],
                          title: _menuTitle[index],
                          noDividerFlag: index == 6 ? true : null,
                        );
                      },
                    ),
                    addH(100.h),
                    // email admin text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/email.svg',
                              color: Colors.white,
                              width: 20.w,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Text(
                          'Email Admin',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    addH(30.h),
                    // twitter, fb, insta logos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon('twitter'),
                        addW(20.w),
                        _socialIcon('fb'),
                        addW(20.w),
                        _socialIcon('instagram'),
                      ],
                    ),
                    addH(30.h),
                    // version details & copyright
                    Text(
                      'Version 12.23.0 (15.1)',
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    addH(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2021 Near Expiry.',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.red.shade900,
                          ),
                        ),
                        addW(5.w),
                        Text(
                          'All Right Resereved.',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String icon) => SvgPicture.asset(
        'assets/svgs/$icon.svg',
        height: 22.h,
        fit: BoxFit.fitHeight,
      );

  Widget buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 0.2,
      indent: 15.w,
      endIndent: 15.w,
    );
  }

  Widget buildMenuTitle(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          // color: ConstantColors.k2377A6,
        ),
      ),
    );
  }
}
