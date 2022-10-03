import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dogventurehq/states/controllers/auth.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authCon = Get.find<AuthController>();
  final TextEditingController _mobileNoCon = TextEditingController();
  final TextEditingController _otpCon = TextEditingController();
  bool _otpSendFlag = false;
  final bool _otpSubmittedFlag = false;
  Country? _selectedCountry;

  @override
  void initState() {
    _authCon.isLoggingIn.listen((value) {
      if (!value && _authCon.isLoggedIn.value) {
        Preference.setLoggedInFlag(true);
        Get.offAllNamed(HomeScreen.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/imgs/login_img.png',
              width: double.infinity,
              height: 395.h,
              fit: BoxFit.fitWidth,
            ),
            addH(10.h),
            Image.asset(
              'assets/imgs/logo.png',
              height: 153.h,
              fit: BoxFit.fitHeight,
            ),
            addH(23.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 68.w,
                vertical: 15.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        _otpSendFlag
                            ? 'assets/svgs/otp.svg'
                            : 'assets/svgs/call.svg',
                      ),
                      addW(10.w),
                      Text(
                        _otpSendFlag ? 'Enter OTP' : 'Mobile Number',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      if (!_otpSendFlag)
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
                      if (!_otpSendFlag)
                        Container(
                          width: 1,
                          height: 20,
                          margin: EdgeInsets.only(right: 5.w),
                          color: Colors.grey,
                        ),
                      Expanded(
                        child: CustomField(
                          textCon: _mobileNoCon,
                          hintText: _otpSendFlag ? '123456' : '123456789',
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ],
              ),
            ),
            _otpSendFlag
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBtn(
                          onPressedFn: () {
                            _authCon.login(
                              email: 'rezaul@royex.net',
                              password: '123456',
                            );
                          },
                          btnTxt: 'Enter OTP',
                          btnSize: Size(115.w, 45.h),
                        ),
                        CustomTxtBtn(
                          onTapFn: () {},
                          text: 'Resend OTP',
                          txtSize: 12.sp,
                        ),
                      ],
                    ),
                  )
                : CustomBtn(
                    onPressedFn: () {
                      setState(() => _otpSendFlag = true);
                    },
                    btnTxt: 'Sent Otp',
                    btnSize: Size(295.w, 45.h),
                  ),
          ],
        ),
      ),
    );
  }
}
