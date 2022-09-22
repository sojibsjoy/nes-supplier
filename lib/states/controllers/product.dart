import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/states/services/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool productsLoading = true.obs;

  ProductsModel? products;

  void getProducts({
    required int supplierID,
  }) async {
    productsLoading(true);
    // Methods.showLoading();
    try {
      var response = await ProductService.getProducts(
        supplierId: supplierID,
      );
      products = ProductsModel.fromJson(response);
    } finally {
      // Methods.hideLoading();
      productsLoading(false);
    }
  }
}
