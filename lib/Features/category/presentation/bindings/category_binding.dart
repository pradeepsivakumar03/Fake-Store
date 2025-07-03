import 'package:fake_store/Features/category/data/datasources/category_data_source.dart';
import 'package:fake_store/Features/category/data/repository/category_repository_impl.dart';
import 'package:fake_store/Features/category/presentation/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDataSourceImpl());
    Get.lazyPut(
        () => CategoryRepositoryImpl(categoryDataSourceImpl: Get.find()));
    Get.lazyPut(() => CategoryController(categoryRepositoryImpl: Get.find()));
  }
}
