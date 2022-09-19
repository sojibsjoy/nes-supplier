import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/home/drawer.dart';
import 'package:dogventurehq/ui/screens/home/filter.dart';
import 'package:dogventurehq/ui/widgets/floating_btn.dart';
import 'package:dogventurehq/ui/widgets/nav_bar.dart';
import 'package:dogventurehq/ui/screens/home/home_con.dart';
import 'package:dogventurehq/ui/screens/home/search_bar.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/my_products.dart';
import 'package:dogventurehq/ui/widgets/product_list.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchCon = TextEditingController();
  bool _isDaily = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
        leadingFn: () => _scaffoldKey.currentState!.openDrawer(),
        leadingIcon: 'assets/svgs/menu.svg',
        titleWidget: Image.asset(
          'assets/imgs/logo_full.png',
          width: 195.w,
          fit: BoxFit.fitWidth,
        ),
      ),
      drawer: HomeDrawer(),
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
              filterIconFn: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (_) => const Filter(),
                );
              },
            ),
            addH(20.h),
            // Product list
            ProductList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingBtn(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
