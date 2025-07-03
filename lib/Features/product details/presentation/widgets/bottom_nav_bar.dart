import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/models/product_model.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../../products/presentation/controllers/product_controller.dart';
import '../../../products/presentation/widgets/item_count.dart';

Widget bottomNavBar({
  required List cartList,
  required Product product,
  required BuildContext context,
  required int index,
  required ProductController productController,
  required CartController cartController,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Obx(() {
      bool isAdded = cartList.any((e) => e.id == product.id);
      return gradientButton(
          text: isAdded ? "Remove From Cart" : "Add To Cart",
          colors: isAdded
              ? [
                  Colors.red.shade600,
                  Colors.red.shade700,
                ]
              : null,
          height: 55,
          icon: isAdded ? Icons.remove_shopping_cart_rounded : null,
          borderRadius: 8.0,
          onTap: () {
            if (!isAdded) {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => ProductQuantityBottomSheet(
                        product: product,
                        onAddToCart: (quantity) {
                          productController.updateProduct(
                              product: product.copyWith(quantity: quantity),
                              index: index);
                          cartController.addProduct(
                            product: product.copyWith(quantity: quantity),
                          );
                        },
                      ));
            } else {
              cartController.removeProduct(product: product);
            }
          });
    }),
  );
}
