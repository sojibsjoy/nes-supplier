import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // customer name
        Text(
          'Md. Sojib Sarker',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        addH(10.h),
        // customer address
        _buildRowTxt(
          icon: 'location',
          txt: '117/5 Semon joyi, Rani pukur,\nSagorpara, Boalia, Rajshahi',
        ),
        addH(10.h),
        // customer contact number
        _buildRowTxt(
          icon: 'call',
          txt: '+880 1716 589947',
        ),
        addH(10.h),
        // invoice number
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invoice Number: ',
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
            Text(
              '#Sc124535',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowTxt({
    required String icon,
    required String txt,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svgs/$icon.svg',
            height: 15.h,
            fit: BoxFit.fitHeight,
          ),
          addW(5.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
        ],
      );
}
