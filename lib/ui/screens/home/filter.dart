import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/widgets/dialog_titlebar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final List<String> _filterItems = [
    'Categories',
    'Sub Categories',
    'Brand',
    'Size',
    'Price',
    'Country of Origin',
  ];

  final List<String> _categories = [
    'Fruits and Vegetables',
    'Dairy and Eggs',
    'Nuts and Seeds',
    'Coffee and Tea',
    'Chips and Snacks',
    'Chocolates',
    'Juices',
    'Household Care',
  ];
  int _selectedIndex = -1;
  String _selectedItem = '';
  bool _nextFlag = false;
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
              onTapFn: () {},
              text: 'clear all',
              txtSize: 12.sp,
            ),
          ),
          addH(20.h),
          _nextFlag
              ? ListView.builder(
                  itemCount: _categories.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _selectedIndex == index,
                          activeColor: Colors.red.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          onChanged: (value) => setState(
                            () => _selectedIndex = index,
                          ),
                        ),
                        addW(5.w),
                        Text(_categories[index]),
                      ],
                    );
                  },
                )
              : _initialBody(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBtn(
                onPressedFn: _nextFlag
                    ? () {
                        print('Apply');
                        Get.back();
                      }
                    : () => setState(() => _nextFlag = true),
                btnTxt: _nextFlag ? 'Apply' : 'Next',
                btnSize: Size(185.w, 50.h),
              ),
              CustomBtn(
                onPressedFn: () => Get.back(),
                btnTxt: 'Cancel',
                btnSize: Size(185.w, 50.h),
                btnColor: Colors.white,
                btnBorderColor: Colors.red.shade900,
                txtColor: Colors.red.shade900,
              ),
            ],
          ),
          addH(20.h),
        ],
      ),
    );
  }

  Widget _initialBody() => ListView.builder(
        itemCount: _filterItems.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => setState(() => _selectedItem = _filterItems[index]),
            title: Text(
              _filterItems[index],
              style: _selectedItem == _filterItems[index]
                  ? TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w600,
                    )
                  : null,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: _selectedItem == _filterItems[index]
                  ? Colors.red.shade900
                  : Colors.black,
              size: 15,
            ),
          );
        },
      );
}
