import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/home/home_con.dart';
import 'package:dogventurehq/ui/screens/home/nav_icon.dart';
import 'package:dogventurehq/ui/screens/home/product_item.dart';
import 'package:dogventurehq/ui/screens/home/search_bar.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/my_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchCon = TextEditingController();
  bool _isDaily = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leadingFn: () => print('menu'),
        leadingIcon: 'assets/svgs/menu.svg',
        titleWidget: Image.asset(
          'assets/imgs/logo_full.png',
          width: 195.w,
          fit: BoxFit.fitWidth,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(10.h),
            // daily & monthly btns
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBtn(
                  onPressedFn: () => setState(() => _isDaily = true),
                  btnTxt: 'Daily',
                  btnSize: Size(100.w, 30.h),
                  btnColor: _isDaily ? null : Colors.white,
                  txtColor: _isDaily ? null : Colors.black,
                  btnBorderColor: Colors.black,
                  btnBorderRadius: 10.r,
                ),
                addW(10.w),
                CustomBtn(
                  onPressedFn: () => setState(() => _isDaily = false),
                  btnTxt: 'Monthly',
                  btnSize: Size(100.w, 30.h),
                  btnColor: _isDaily ? Colors.white : null,
                  txtColor: _isDaily ? Colors.black : null,
                  btnBorderColor: Colors.black,
                  btnBorderRadius: 10.r,
                ),
              ],
            ),
            addH(10.h),
            // chart
            Image.asset(
              'assets/imgs/chart.png',
              width: 395.w,
              fit: BoxFit.fitWidth,
            ),
            addH(20.h),
            // total earnings, pending payment, & total orders
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // total earnings
                HomeCon(
                  icon: 'cash',
                  title: 'Total Earnings',
                  amount: 'AED 50,000',
                ),
                // total earnings
                HomeCon(
                  icon: 'loading',
                  title: 'Pending Payment',
                  amount: 'AED 2,000',
                  iconBg: Colors.red.shade900,
                  brdrClr: Colors.black,
                ),
                // total earnings
                HomeCon(
                  icon: 'order',
                  title: 'Total Orders',
                  amount: '3,259',
                ),
              ],
            ),
            addH(35.h),
            // divider
            Divider(
              indent: 20.w,
              endIndent: 20.w,
              thickness: 1,
              color: Colors.grey,
            ),
            addH(30.h),
            // my products title, add new product btn, view all btn
            MyProducts(
              suffixWidget: CustomTxtBtn(
                onTapFn: () => Get.toNamed(
                  ProductsScreen.routeName,
                ),
                text: 'view all',
                txtClr: Colors.red.shade900,
              ),
            ),
            addH(10.h),
            // search bar
            SearchBar(
              searchCon: _searchCon,
            ),
            addH(20.h),
            // Product list
            ListView.builder(
              itemCount: 10,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const ProductItem();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 3,
            color: Colors.red.shade900,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: NavIcon(
            onTapFn: () => Get.toNamed(
              MyOrdersScreen.routeName,
            ),
            icon: 'order',
            iconClr: Colors.black,
            iconSize: 25.h,
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
              onTapFn: () {},
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
              onTapFn: () {},
              icon: 'person',
              title: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
