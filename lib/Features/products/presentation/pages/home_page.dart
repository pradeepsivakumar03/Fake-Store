import 'dart:developer';
import 'package:fake_store/Features/products/presentation/controllers/product_controller.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fake Store",
                  style: GoogleFonts.greatVibes(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Hero(
                      tag: 'cart',
                      child: IconButton(
                          onPressed: () => Get.toNamed(Routes.cartPage),
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )),
                    ),
                    GestureDetector(
                        onTap: () => Get.toNamed(Routes.category),
                        child: Image.asset(
                          'lib/core/utils/assets/icons/category.png',
                          height: 25,
                          width: 25,
                        ))
                  ],
                )
              ],
            ),
            Obx(() {
              log(productController.productList.length.toString());
              return productController.isLoading.isTrue
                  ? const Padding(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    )
                  : productController.errorMsg != ''
                      ? Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Center(
                              child:
                                  Text('Error: ${productController.errorMsg}')))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: productController.productList.length,
                              itemBuilder: (context, index) {
                                final Product product =
                                    productController.productList[index];
                                // bool isInCart = cartController.cartProducts
                                //     .any((e) => e.id == product.id);
                                return ProductCard(
                                  product: product, showQuantity: false,
                                  index: index,
                                  // isInCart: isInCart,
                                  // cartController: cartController,
                                );
                              }),
                        );
            }),
          ],
        ),
      ),
    ));
  }
}
