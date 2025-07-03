import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/core/constants/colors.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../controllers/product_controller.dart';
import 'item_count.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool showQuantity;
  final int index;
  const ProductCard({
    super.key,
    required this.product,
    required this.showQuantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final ProductController productController = Get.find<ProductController>();
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.productDetails, arguments: [product, index]),
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppPalettes.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'img${product.id}',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
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
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.3,
                          letterSpacing: -0.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.amber.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${product.rating['rate']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "(${product.rating['count']} reviews)",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      showQuantity
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.blue.withOpacity(0.3),
                                  border:
                                      Border.all(color: Colors.blue.shade900)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8.0),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            ProductQuantityBottomSheet(
                                              product: product,
                                              initialQuantity: product.quantity,
                                              onAddToCart: (quantity) {
                                                cartController.updateQuantity(
                                                  product: product.copyWith(
                                                      quantity: quantity),
                                                  index: index,
                                                );
                                              },
                                            ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 2.0, horizontal: 8.0)
                                        .copyWith(right: 0.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Quantity: ${product.quantity}",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.blue,
                                          // size: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showQuantity && product.quantity > 1
                              ? RichText(
                                  text: TextSpan(
                                    text:
                                        '₹${(product.price * product.quantity).toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          height: 1.2,
                                          letterSpacing: -0.5,
                                        ),
                                    children: [
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.top,
                                        child: Transform.translate(
                                          offset: const Offset(3, -1.5),
                                          child: Text(
                                            "* ${product.quantity.toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.blue.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: -0.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
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
                        ],
                      ),
                      Obx(() {
                        bool isInCart = cartController.cartProducts
                            .any((e) => e.id == product.id);
                        return gradientButton(
                            text: isInCart ? "Remove" : "Add",
                            colors: isInCart
                                ? [
                                    Colors.red.shade500,
                                    Colors.red.shade700,
                                  ]
                                : null,
                            shadowColor:
                                isInCart ? Colors.red.withOpacity(0.3) : null,
                            icon: isInCart
                                ? Icons.remove_shopping_cart_rounded
                                : null,
                            onTap: () {
                              if (!isInCart) {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) =>
                                        ProductQuantityBottomSheet(
                                          product: product,
                                          onAddToCart: (quantity) {
                                            productController.updateProduct(
                                                product: product.copyWith(
                                                    quantity: quantity),
                                                index: index);
                                            cartController.addProduct(
                                              product: product.copyWith(
                                                  quantity: quantity),
                                            );
                                          },
                                        ));
                              } else {
                                log("${product.title},${product.image},${product.quantity},Count:${cartController.cartProducts.length}");
                                cartController.removeProduct(product: product);
                              }
                            });
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
