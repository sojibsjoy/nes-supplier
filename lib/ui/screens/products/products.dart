import 'package:dogventurehq/states/controllers/product.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/filter.dart';
import 'package:dogventurehq/ui/screens/home/search_bar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/my_products.dart';
import 'package:dogventurehq/ui/widgets/product_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductController _productCon = Get.find<ProductController>();
  final TextEditingController _searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Products',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(10.h),
            // my products title
            MyProducts(),
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
            addH(10.h),
            // Product list
            ProductList(
              productsList: _productCon.products!.productListRequestModels,
            ),
          ],
        ),
      ),
    );
  }
}
