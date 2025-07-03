import 'package:fake_store/Features/cart/presentation/controllers/cart_controller.dart';
import 'package:fake_store/Features/products/presentation/bindings/product_binding.dart';
import 'package:fake_store/routes/app_pages.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Features/cart/data/datasources/local_data_source.dart';
import 'Features/cart/data/repository/local_repository_impl.dart';
import 'core/theme/theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  Get.lazyPut(() => Hive.box(name: 'cart'));
  Get.lazyPut(() => LocalDataSourceImpl(box: Get.find()));
  Get.lazyPut(() => LocalRepositoryImpl(localDataSourceImpl: Get.find()));
  Get.put(CartController(localRepositoryImpl: Get.find()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Store',
      theme: AppTheme.darkTheme,
      initialRoute: Routes.homePage,
      getPages: AppPages.routes,
      initialBinding: ProductBinding(),
    );
  }
}
