import 'package:fake_store/Features/products/data/datasource/data_implementation.dart';
import 'package:fake_store/Features/products/data/model/product.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSourceImpl productDataSource;

  ProductRepositoryImpl({required this.productDataSource});
  @override
  Future<List<Product>> getProducts() async {
    final res = await productDataSource.getProducts();
    return res.map((e) => ProductModel.fromJson(e)).toList();
  }
}
