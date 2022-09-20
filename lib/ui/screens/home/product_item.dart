import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  final String imgUrl;
  final String productName;
  final String productWeight;
  final double productPrice;
  final int index;
  Widget? suffixWidget;
  ProductItem({
    Key? key,
    required this.imgUrl,
    required this.productName,
    required this.productWeight,
    required this.productPrice,
    required this.index,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('$index'),
      endActionPane: ActionPane(
        extentRatio: 0.16,
        motion: const ScrollMotion(),
        children: [
          SizedBox(
            width: 60.w,
            height: 95.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 35.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/delete.svg',
                    ),
                  ),
                ),
                Container(
                  width: 35.w,
                  height: 40.h,
                  margin: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/edit.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      child: Container(
        width: 388.w,
        height: 95.h,
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            // product image
            Container(
              width: 80.w,
              height: 70.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: CustomImg(
                  imgUrl: imgUrl,
                ),
              ),
            ),
            // product description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // product name
                SizedBox(
                  width: 268.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 175.w,
                        child: Text(
                          productName,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      if (suffixWidget != null) const Spacer(),
                      if (suffixWidget != null) suffixWidget!,
                    ],
                  ),
                ),
                // product weight
                Text(
                  productWeight,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
                // product price
                Row(
                  children: [
                    Text(
                      'AED',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                    ),
                    addW(5.w),
                    Text(
                      productPrice.round().toString(),
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
