import 'package:fake_store/Features/products/presentation/controllers/product_controller.dart';
import 'package:fake_store/Features/products/presentation/widgets/product_card.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments;
    final productController = Get.find<ProductController>();
    return Scaffold(
      body: SafeArea(
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
                Text(
                  category,
                  style: GoogleFonts.greatVibes(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Obx(() {
              final List<Product> productList = productController.productList
                  .where((e) => e.category == category.toLowerCase())
                  .toList();
              return Expanded(
                  child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        final Product product = productList[index];
                        return ProductCard(
                            product: product,
                            showQuantity: false,
                            index: index);
                      }));
            })
          ],
        ),
      ),
    );
  }
}
