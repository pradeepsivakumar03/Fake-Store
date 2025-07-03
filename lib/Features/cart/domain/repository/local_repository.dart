import '../../../../core/utils/models/product_model.dart';

abstract interface class LocalRepository {
  List<Product> getProducts();
  void addProduct({required Product product});
  void removeProduct({required Product product});
  void updateQuantity({required Product product});
}
