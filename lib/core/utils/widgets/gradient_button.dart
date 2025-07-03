import 'package:flutter/material.dart';

Widget gradientButton(
    {List<Color>? colors,
    Color? shadowColor,
    required String text,
    IconData? icon,
    double? height,
    double? borderRadius,
    required Function()? onTap}) {
  return Container(
    height: height ?? 44,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: colors ??
            [
              Colors.blue.shade600,
              Colors.blue.shade700,
            ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Colors.blue.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
