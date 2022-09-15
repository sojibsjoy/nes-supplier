import 'package:dogventurehq/ui/widgets/nav_icon.dart';
import 'package:dogventurehq/ui/screens/profile/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 60.h,
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red.shade900,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavIcon(
            onTapFn: () {
              if (Get.currentRoute == ProfileScreen.routeName) {
                Get.back();
                return;
              }
            },
            icon: 'home',
            title: 'Home',
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 25.h,
              left: 50.w,
              right: 50.w,
            ),
            child: Text(
              'Orders',
              style: TextStyle(
                color: Colors.red.shade900,
                fontSize: 12.sp,
              ),
            ),
          ),
          NavIcon(
            onTapFn: () => Get.toNamed(
              ProfileScreen.routeName,
            ),
            icon: 'person',
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}
