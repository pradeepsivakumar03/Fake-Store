import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/Features/cart/presentation/controllers/cart_controller.dart';
import 'package:fake_store/Features/product%20details/presentation/widgets/bottom_nav_bar.dart';
import 'package:fake_store/Features/products/presentation/controllers/product_controller.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import '../../../../core/utils/formats/capitalize.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments[0];
    final int index = Get.arguments[1];
    final CartController cartController = Get.find<CartController>();
    final ProductController productController = Get.find<ProductController>();
    final List<Product> cartList = cartController.cartProducts;
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Hero(
                      tag: 'img${product.id}',
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        height: 300,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'title${product.id}',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  height: 1.3,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StarRating(
                                rating: product.rating['rate'].toDouble(),
                                size: 13,
                                borderColor: Colors.amber.withOpacity(0.3),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "(${product.rating['count']} reviews)",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              height: 1.2,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            'Free delivery',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // const Text(
                          //   'Category',
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     letterSpacing: -0.5,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // const SizedBox(height: 2),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.amber.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.amber.shade800,
                                )),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            child: Text(
                              capitalizeEachWord(product.category),
                              style: const TextStyle(
                                fontSize: 10,
                                letterSpacing: -0.5,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // const Text(
                          //   "Description",
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // const SizedBox(height: 2),
                          Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 14,
                              letterSpacing: -0.2,
                              height: 1.38,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 8,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10).copyWith(right: 12),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Positioned(
                  top: 8,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.cartPage),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10).copyWith(left: 12),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ),
        bottomNavigationBar: bottomNavBar(
            cartList: cartList,
            product: product,
            context: context,
            index: index,
            productController: productController,
            cartController: cartController));
  }
}
