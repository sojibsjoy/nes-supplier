import 'package:dogventurehq/states/controllers/product.dart';
import 'package:get/instance_manager.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
