import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/product_item.dart';
import 'package:dogventurehq/ui/screens/home/search_bar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/my_products.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
            ),
            addH(10.h),
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
    );
  }
}
