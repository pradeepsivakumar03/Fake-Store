import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../core/error/error_handling.dart';

abstract interface class ProductDataSource {
  Future<dynamic> getProducts();
}

class ProductDataSourceImpl implements ProductDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
  @override
  Future<List<dynamic>> getProducts() async {
    try {
      final res = await _dio.get('/products');
      log(res.statusCode.toString());
      return res.data;
      // return res.data.map((e) => ProductModel.fromJson(e));
    } on ServerException catch (e) {
      log(e.toString());
      throw ServerException(message: e.toString());
    }
  }
}
