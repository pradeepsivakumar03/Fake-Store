import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

Widget quickQuantity(
    {required int maxQuantity,
    required int quantity,
    required Function()? updateQuantity}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [1, 5, 10, 20].map((qty) {
      if (qty > maxQuantity) return Container();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: updateQuantity,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: quantity == qty
                  ? AppPalettes.primaryColor
                  : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    quantity == qty ? Colors.blue.shade300 : Colors.transparent,
              ),
            ),
            child: Text(
              qty.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: quantity == qty
                    ? Colors.blue.shade700
                    : Colors.grey.shade600,
              ),
            ),
          ),
        ),
      );
    }).toList(),
  );
}
