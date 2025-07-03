import 'package:fake_store/core/constants/colors.dart';
import 'package:fake_store/core/utils/models/product_model.dart';
import 'package:flutter/material.dart';

Widget showDetailsCard(
    {required BuildContext context, required List<Product> cartList}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
        color: AppPalettes.scaffoldBG),
    height: 260,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Summary",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final Product product = cartList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: Text(
                    "${index + 1}.",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    product.title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "Quantity: ${product.quantity} • Price: ₹${product.price}",
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        // letterSpacing: -0.2,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    "₹${(product.price * product.quantity).toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        // letterSpacing: -0.2,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
