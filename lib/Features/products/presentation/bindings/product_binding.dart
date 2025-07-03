import 'package:fake_store/Features/products/data/datasource/data_implementation.dart';
import 'package:fake_store/Features/products/data/repository/product_repository_impl.dart';
import 'package:fake_store/Features/products/presentation/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDataSourceImpl());
    Get.lazyPut(() => ProductRepositoryImpl(productDataSource: Get.find()));
    Get.lazyPut(() => ProductController(productRepository: Get.find()));
  }
}
