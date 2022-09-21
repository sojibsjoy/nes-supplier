import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/states/data/routes.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AllRoutes.allroutes,
          initialRoute: SplashScreen.routeName,
          initialBinding: InitialBinding(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
