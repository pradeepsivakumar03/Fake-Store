// import 'package:fake_store/Features/cart/data/datasources/local_data_source.dart';
// import 'package:fake_store/Features/cart/data/repository/local_repository_impl.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';

// class LocalBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => Hive.box(name: 'cart'));
//     Get.lazyPut(() => LocalDataSourceImpl(box: Get.find()));
//     Get.lazyPut(() => LocalRepositoryImpl(localDataSourceImpl: Get.find()));
//     // Get.lazyPut(() => CartController(localRepositoryImpl: Get.find()),
//     //     fenix: true);
//   }
// }
