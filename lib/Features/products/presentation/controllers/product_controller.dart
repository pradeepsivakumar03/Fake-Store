import 'package:get/get.dart';
import '../../../../core/utils/models/product_model.dart';
import '../../data/repository/product_repository_impl.dart';

class ProductController extends GetxController {
  final ProductRepositoryImpl productRepository;
  List<Product> productList = <Product>[].obs;
  var isLoading = true.obs;
  var errorMsg = ''.obs;

  ProductController({required this.productRepository});

  Future<void> getProducts() async {
    isLoading.value = true;
    try {
      final res = await productRepository.getProducts();
      productList.addAll(res);
      isLoading.value = false;
    } catch (e) {
      errorMsg.value = e.toString();
      isLoading.value = false;
    }
  }

  void updateProduct({required Product product, required int index}) {
    if (index >= 0 && index < productList.length) {
      productList[index] = product;
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
