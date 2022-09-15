import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  Widget? suffixWidget;
  ProductItem({
    Key? key,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 95.h,
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
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
              child: Image.asset(
                'assets/imgs/product.png',
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
                width: 265.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        'Saan Padi - Chocolate Flavour',
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
                '250 gm',
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
                    '30',
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
    );
  }
}
