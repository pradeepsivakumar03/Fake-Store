import 'package:fake_store/Features/category/data/datasources/category_data_source.dart';

import '../../domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSourceImpl categoryDataSourceImpl;

  CategoryRepositoryImpl({required this.categoryDataSourceImpl});
  @override
  Future<List<String>> getCategories() async {
    final res = await categoryDataSourceImpl.getAllCategories();
    return res.map((e) => e.toString()).toList();
  }
}
