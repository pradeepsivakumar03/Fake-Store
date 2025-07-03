import 'package:dio/dio.dart';
import 'package:fake_store/core/error/error_handling.dart';

abstract interface class CategoryDataSource {
  Future<List<dynamic>> getAllCategories();
}

class CategoryDataSourceImpl implements CategoryDataSource {
  @override
  Future<List<dynamic>> getAllCategories() async {
    try {
      final res =
          await Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/products'))
              .get('/categories');
      return res.data;
    } on ServerException catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
