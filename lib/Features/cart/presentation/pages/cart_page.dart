import 'package:fake_store/Features/cart/presentation/controllers/cart_controller.dart';
import 'package:fake_store/Features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/models/product_model.dart';
import '../../../../core/utils/widgets/gradient_button.dart';
import '../widgets/cart_details_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text(
                      "Cart",
                      style: GoogleFonts.greatVibes(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Hero(
                    tag: 'cart',
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Obx(() {
                final List<Product> cartItemList = cartController.cartProducts;
                return cartItemList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 25, bottom: 10),
                                child: Image.asset(
                                  'lib/core/utils/assets/icons/empty-cart.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const Text(
                                "Cart Empty!",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ]),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: cartItemList.length,
                            itemBuilder: (context, index) {
                              final Product product = cartItemList[index];
                              return ProductCard(
                                product: product,
                                showQuantity: true,
                                index: index,
                                // isInCart: true,
                                // cartController: cartController,
                              );
                            }),
                      );
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return cartController.cartProducts.isEmpty
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isExpanded
                      ? showDetailsCard(
                          context: context,
                          cartList: cartController.cartProducts)
                      : const SizedBox(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      height: 77,
                      padding: const EdgeInsets.all(15)
                          .copyWith(bottom: 10.0, top: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${cartController.grandTotal.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        height: 1.3),
                                  ),
                                  // const SizedBox(height: 1.0),
                                  const Text(
                                    "Total Price",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                        fontSize: 12,
                                        height: 1.2),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              gradientButton(
                                text: "Place Order",
                                borderRadius: 8.0,
                                height: 47,
                                colors: [
                                  Colors.amber.shade500,
                                  Colors.amber.shade700
                                ],
                                onTap: () {},
                              )
                            ],
                          ),
                          const SizedBox(height: 1.0),
                          Text(
                            isExpanded
                                ? "Tap to close details"
                                : "Tap to view details",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white54,
                                fontSize: 9,
                                height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
