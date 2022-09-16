import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAddressScreen extends StatefulWidget {
  static String routeName = '/add_address';
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _address = TextEditingController();
  Country? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Add New Address',
        noSuffixIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 65.w),
        child: Column(
          children: [
            addH(30.h),
            _fieldTitle(icon: 'person', title: 'Full Name'),
            _txtField(textCon: _nameCon, hintTxt: 'Md. Sojib Sarker'),
            addH(20.h),
            _fieldTitle(icon: 'email', title: 'Email'),
            _txtField(textCon: _emailCon, hintTxt: 'joy@gmail.com'),
            addH(20.h),
            _fieldTitle(icon: 'call', title: 'Mobile Number'),
            Row(
              children: [
                if (true)
                  CountryPickerDropdown(
                    itemBuilder: (country) => Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CountryPickerUtils.getDefaultFlagImage(
                            country,
                          ),
                        ),
                        addW(10.w),
                        Text(
                          "+${country.phoneCode}",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    onValuePicked: (country) => setState(
                      () => _selectedCountry = country,
                    ),
                  ),
                Container(
                  width: 1,
                  height: 20,
                  margin: EdgeInsets.only(right: 5.w),
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 190.w,
                  child: _txtField(
                    textCon: _phoneNo,
                    hintTxt: '1716589947',
                  ),
                )
              ],
            ),
            addH(20.h),
            _fieldTitle(icon: 'location', title: 'Address'),
            _txtField(
              textCon: _address,
              hintTxt: '117/5 Semon Joyi, Rani Pukur, Sagor para',
            ),
            addH(20.h),
            CustomBtn(
              onPressedFn: () {},
              btnTxt: 'Submit',
              btnSize: Size(295.w, 45.h),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldTitle({
    required String icon,
    required String title,
  }) =>
      Row(
        children: [
          SvgPicture.asset(
            "assets/svgs/$icon.svg",
            width: 18.h,
            fit: BoxFit.fitWidth,
          ),
          addW(8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      );

  Widget _txtField({
    required TextEditingController textCon,
    required String hintTxt,
  }) =>
      SizedBox(
        height: 35.h,
        child: TextField(
          controller: textCon,
          style: TextStyle(
            fontSize: 12.sp,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 20.h),
            hintText: hintTxt,
            hintStyle: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
      );
}
