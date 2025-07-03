import 'package:fake_store/Features/cart/presentation/pages/cart_page.dart';
import 'package:fake_store/Features/category/presentation/bindings/category_binding.dart';
import 'package:fake_store/Features/category/presentation/pages/product_list_page.dart';
import 'package:fake_store/Features/product%20details/presentation/pages/product_details.dart';
import 'package:fake_store/Features/products/presentation/bindings/product_binding.dart';
import 'package:fake_store/Features/products/presentation/pages/home_page.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:get/get.dart';
import '../Features/category/presentation/pages/category_list_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      bindings: [
        ProductBinding(),
        // LocalBindings(),
      ],
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => const ProductDetailsPage(),
      // binding: LocalBindings(),
    ),
    GetPage(
      name: Routes.cartPage,
      page: () => const CartPage(),
      // binding: LocalBindings(),
    ),
    GetPage(
        name: Routes.category,
        page: () => const CategoryListPage(),
        binding: CategoryBinding()),
    GetPage(
      name: Routes.productlist,
      page: () => const ProductListPage(),
    ),
  ];
}
