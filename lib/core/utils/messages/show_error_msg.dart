import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController errorMsg(
    {required String title,
    required String message,
    Color? bgColor,
    IconData? icon}) {
  return Get.snackbar(title, message,
      backgroundColor: bgColor ?? Colors.red,
      animationDuration: const Duration(milliseconds: 200),
      icon: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
        padding: const EdgeInsets.all(8),
        child: Icon(icon ?? Icons.error_outline_rounded),
      ),
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      messageText: Text(message,
          style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w400,
              fontSize: 14.0)),
      padding: const EdgeInsets.all(10).copyWith(left: 20));
}
