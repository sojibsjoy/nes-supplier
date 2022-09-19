import 'package:dogventurehq/ui/designs/custom_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static String routeName = '/privacy_policy';
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleTxt: 'Privacy Policy',
        noSuffixIcon: true,
      ),
    );
  }
}
