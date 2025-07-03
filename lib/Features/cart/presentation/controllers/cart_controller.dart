import 'package:fake_store/Features/cart/data/repository/local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/messages/show_success_msg.dart';
import '../../../../core/utils/models/product_model.dart';

class CartController extends GetxController {
  final LocalRepositoryImpl localRepositoryImpl;

  CartController({required this.localRepositoryImpl});

  final RxList<Product> cartProducts = <Product>[].obs;
  var grandTotal = 0.0.obs;

  void getProducts() {
    cartProducts.clear();
    cartProducts.addAll(localRepositoryImpl.getProducts());
    calcTotal();
    cartProducts.refresh();
  }

  void addProduct({required Product product}) {
    localRepositoryImpl.addProduct(product: product);
    // cartProducts.add(product);
    calcTotal();
    getProducts();
    successMsg(
        title: "Cart",
        message: "${product.title} added to cart",
        bgColor: Colors.black);
  }

  // cartProducts.removeWhere((p) => p.id == product.id);
  void removeProduct({required Product product}) {
    localRepositoryImpl.removeProduct(product: product);
    calcTotal();
    getProducts();
    successMsg(
        title: "Cart",
        message: "${product.title} removed from cart",
        bgColor: Colors.black,
        icon: Icons.remove_shopping_cart_rounded);
  }

  void updateQuantity({required Product product, required int index}) {
    localRepositoryImpl.updateQuantity(product: product);
    getProducts();
    // cartProducts[index] = product;
    // log("Updated:${product.quantity} ");
    calcTotal();
  }

  void calcTotal() {
    grandTotal.value = cartProducts.fold(
        0.0, (sum, product) => sum + product.price * product.quantity);
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
