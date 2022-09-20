import 'package:dogventurehq/states/controllers/order.dart';
import 'package:get/instance_manager.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}
