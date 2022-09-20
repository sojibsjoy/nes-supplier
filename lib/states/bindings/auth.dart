import 'package:dogventurehq/states/controllers/auth.dart';
import 'package:get/instance_manager.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
