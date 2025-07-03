import 'package:fake_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget buildQuantityButton({
  required IconData icon,
  required VoidCallback onPressed,
  required bool enabled,
}) {
  return Container(
    decoration: BoxDecoration(
      color: enabled ? AppPalettes.primaryColor : AppPalettes.backgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: enabled ? Colors.grey.shade300 : Colors.grey.shade600,
        width: 1.5,
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            icon,
            color: enabled ? Colors.grey.shade700 : Colors.grey.shade400,
            size: 20,
          ),
        ),
      ),
    ),
  );
}
