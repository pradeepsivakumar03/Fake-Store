import 'package:fake_store/core/utils/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getProducts();
}
