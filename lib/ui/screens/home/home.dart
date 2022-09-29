import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/product.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/supplier.dart';
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
  final ProductController _productCon = Get.find<ProductController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchCon = TextEditingController();
  late SupplierModel _supplierInfo;
  bool _isDaily = true;

  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    _productCon.getDashboardData(supplierID: _supplierInfo.supplierId);
    _productCon.getProducts(supplierID: _supplierInfo.supplierId);
    super.initState();
  }

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
      drawer: HomeDrawer(
        supplierInfo: _supplierInfo,
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
            Obx(
              () {
                if (_productCon.dashboardLoading.value) {
                  return SizedBox(
                    height: 300.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_productCon.dashboardData == null) {
                    return SizedBox(
                      height: 300.h,
                      child: Center(
                        child: Text(ConstantStrings.kNoData),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 300.h,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/imgs/chart.png',
                            height: 180.w,
                            fit: BoxFit.fitHeight,
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
                                amount: _isDaily
                                    ? 'AED ${_productCon.dashboardData!.totalSaleDaily}'
                                    : 'AED ${_productCon.dashboardData!.totalSaleThisMonth}',
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
                                amount: _supplierInfo.totalOrder.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
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
                  builder: (_) => Filter(
                    pCon: _productCon,
                  ),
                );
              },
            ),
            addH(20.h),
            // Product list
            Obx(() {
              if (_productCon.productsLoading.value) {
                return const CircularProgressIndicator();
              } else {
                if (_productCon.products == null) {
                  return Text(ConstantStrings.kNoData);
                } else {
                  return ProductList(
                    productsList:
                        _productCon.products!.productListRequestModels,
                  );
                }
              }
            })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingBtn(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
