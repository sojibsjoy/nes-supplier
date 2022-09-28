import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/product.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/brand.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/models/supplier.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/home/brands.dart';
import 'package:dogventurehq/ui/screens/home/categories.dart';
import 'package:dogventurehq/ui/screens/home/filter_btm.dart';
import 'package:dogventurehq/ui/widgets/dialog_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  final ProductController pCon;
  const Filter({
    Key? key,
    required this.pCon,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late SupplierModel _supplierInfo;
  final List<String> _filterItems = [
    'Categories',
    // 'Sub Categories',
    'Brand',
    // 'Size',
    'Price',
    // 'Country of Origin',
  ];

  int? _selectedItem;
  List<CategoryModel> _selectedCategories = List.empty();
  List<BrandModel> _selectedBrands = List.empty();
  bool _nextFlag = false;

  @override
  void initState() {
    _supplierInfo = Preference.getUserDetails();
    widget.pCon.getCategories();
    widget.pCon.getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630.h,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // title bar
          DialogTitleBar(
            prefixOnTapFn: _nextFlag
                ? () => setState(
                      () => _nextFlag = false,
                    )
                : () => Get.back(),
            title: 'Filter',
            suffixWidget: CustomTxtBtn(
              onTapFn: () => setState(() {
                _selectedCategories.clear();
                _selectedBrands.clear();
              }),
              text: 'clear all',
              txtSize: 12.sp,
            ),
          ),
          addH(20.h),
          SizedBox(
            height: 520.h,
            child: _nextFlag ? getNextView() : _initialBody(),
          )
        ],
      ),
    );
  }

  Widget getNextView() {
    switch (_selectedItem) {
      case 0:
        return Categories(
          pCon: widget.pCon,
          supplierId: _supplierInfo.supplierId,
          selectedCategories: _selectedCategories,
          setCategoriesFn: (List<CategoryModel> categories) =>
              _selectedCategories = categories,
        );
      case 1:
        return Brands(
          pCon: widget.pCon,
          supplierId: _supplierInfo.supplierId,
          selectedBrands: _selectedBrands,
          setBrandsFn: (List<BrandModel> brands) => _selectedBrands = brands,
        );
      default:
        return Text(ConstantStrings.kWentWrong);
    }
  }

  Widget _initialBody() => Column(
        children: [
          ListView.builder(
            itemCount: _filterItems.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => setState(() {
                  _nextFlag = true;
                  _selectedItem = index;
                }),
                title: Text(
                  _filterItems[index],
                  style: _selectedItem == index
                      ? TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.w600,
                        )
                      : null,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: _selectedItem == index
                      ? Colors.red.shade900
                      : Colors.black,
                  size: 15,
                ),
              );
            },
          ),
          const Spacer(),
          FilterBtm(
            onTapFn: () {
              List<int> categoryIds = List.empty(growable: true);
              List<int> brandIds = List.empty(growable: true);
              for (var element in _selectedCategories) {
                categoryIds.add(element.categoryId);
              }
              for (var element in _selectedBrands) {
                brandIds.add(element.brandId);
              }
              widget.pCon.getProducts(
                supplierID: _supplierInfo.supplierId,
                categoryIDs: categoryIds,
                brandIDs: brandIds,
              );
              Get.back();
            },
          ),
          addH(8.h),
        ],
      );
}
