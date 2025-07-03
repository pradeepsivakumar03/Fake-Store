import 'package:fake_store/Features/cart/data/datasources/local_data_source.dart';
import 'package:fake_store/Features/cart/domain/repository/local_repository.dart';
import 'package:fake_store/Features/products/data/model/product.dart';
import 'package:fake_store/core/utils/models/product_model.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSourceImpl localDataSourceImpl;

  LocalRepositoryImpl({required this.localDataSourceImpl});
  @override
  void addProduct({required Product product}) {
    localDataSourceImpl.addProduct(
        product: ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: product.rating,
      quantity: product.quantity,
    ));
  }

  @override
  List<Product> getProducts() {
    final res = localDataSourceImpl.getProducts();
    return res;
  }

  @override
  void removeProduct({required Product product}) {
    localDataSourceImpl.removeProduct(
      product: ProductModel(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description,
        category: product.category,
        image: product.image,
        rating: product.rating,
        quantity: product.quantity,
      ),
    );
  }

  @override
  void updateQuantity({required Product product}) {
    localDataSourceImpl.updateQuantity(
        product: ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: product.rating,
      quantity: product.quantity,
    ));
  }
}
