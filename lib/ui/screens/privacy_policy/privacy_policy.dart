import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/home.dart';
import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static String routeName = '/privacy_policy';
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final HomeController _homeCon = Get.find<HomeController>();

  @override
  void initState() {
    _homeCon.getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeCon = Get.find<HomeController>();
    homeCon.getPrivacyPolicy();
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Privacy Policy',
        noSuffixIcon: true,
      ),
      body: Center(
        child: Obx(
          () => _homeCon.privacyLoading.value
              ? const CircularProgressIndicator()
              : _homeCon.policy == null
                  ? Text(
                      ConstantStrings.kNoData,
                    )
                  : Text(
                      _parseHtmlString(_homeCon.policy!.html),
                    ),
        ),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(
      document.body!.text,
    ).documentElement!.text;
    return parsedString;
  }
}
