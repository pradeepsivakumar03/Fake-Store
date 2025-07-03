import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController successMsg(
    {required String title,
    required String message,
    Color? bgColor,
    IconData? icon}) {
  return Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor ?? Colors.green,
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 1300),
      icon: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
        padding: const EdgeInsets.all(8),
        child: Icon(icon ?? Icons.done_outline_rounded),
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
