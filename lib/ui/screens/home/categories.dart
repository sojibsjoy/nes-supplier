import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/product.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  final ProductController pCon;
  final int supplierId;
  final List<CategoryModel> selectedCategories;
  final void Function(List<CategoryModel>) setCategoriesFn;
  const Categories({
    Key? key,
    required this.pCon,
    required this.supplierId,
    required this.selectedCategories,
    required this.setCategoriesFn,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<CategoryModel> _selectedCategories = List.empty(growable: true);

  @override
  void initState() {
    for (var element in widget.selectedCategories) {
      _selectedCategories.add(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.pCon.categoriesLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (widget.pCon.categories.isEmpty) {
          return Center(child: Text(ConstantStrings.kNoData));
        } else {
          return Column(
            children: [
              SizedBox(
                height: 450.h,
                child: ListView.builder(
                  itemCount: widget.pCon.categories.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _selectedCategories.contains(
                            widget.pCon.categories[index],
                          ),
                          activeColor: Colors.red.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          onChanged: (value) => setState(
                            () {
                              value!
                                  ? _selectedCategories.add(
                                      widget.pCon.categories[index],
                                    )
                                  : _selectedCategories.remove(
                                      widget.pCon.categories[index],
                                    );
                              widget.setCategoriesFn(_selectedCategories);
                            },
                          ),
                        ),
                        addW(5.w),
                        Text(widget.pCon.categories[index].name),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      }
    });
  }
}
