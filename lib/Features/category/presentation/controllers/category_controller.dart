import 'package:fake_store/Features/category/data/repository/category_repository_impl.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryRepositoryImpl categoryRepositoryImpl;

  CategoryController({required this.categoryRepositoryImpl});

  RxList<String> categoryList = <String>[].obs;
  var isLoading = true.obs;

  void getCategories() async {
    isLoading.value = true;
    final res = await categoryRepositoryImpl.getCategories();
    categoryList.addAll(res);
    isLoading.value = false;
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
