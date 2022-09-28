import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/product.dart';
import 'package:dogventurehq/states/models/brand.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Brands extends StatefulWidget {
  final ProductController pCon;
  final int supplierId;
  final List<BrandModel> selectedBrands;
  final void Function(List<BrandModel>) setBrandsFn;
  const Brands({
    Key? key,
    required this.pCon,
    required this.supplierId,
    required this.selectedBrands,
    required this.setBrandsFn,
  }) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  final List<BrandModel> _selectedBrands = List.empty(growable: true);

  @override
  void initState() {
    for (var element in widget.selectedBrands) {
      _selectedBrands.add(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.pCon.brandsLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (widget.pCon.brands.isEmpty) {
          return Center(child: Text(ConstantStrings.kNoData));
        } else {
          return Column(
            children: [
              SizedBox(
                height: 450.h,
                child: ListView.builder(
                  itemCount: widget.pCon.brands.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _selectedBrands
                              .contains(widget.pCon.brands[index]),
                          activeColor: Colors.red.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          onChanged: (value) => setState(() {
                            value!
                                ? _selectedBrands.add(
                                    widget.pCon.brands[index],
                                  )
                                : _selectedBrands.remove(
                                    widget.pCon.brands[index],
                                  );
                            widget.setBrandsFn(_selectedBrands);
                          }),
                        ),
                        addW(5.w),
                        Text(widget.pCon.brands[index].title),
                      ],
                    );
                  },
                ),
              ),
              addH(10.h),
            ],
          );
        }
      }
    });
  }
}
