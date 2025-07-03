import 'package:fake_store/core/constants/colors.dart';
import 'package:fake_store/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryCard({required String text}) {
  return GestureDetector(
    onTap: () => Get.toNamed("${Routes.productlist}/${text.toLowerCase()}",
        arguments: text),
    child: Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppPalettes.primaryColor),
      height: 240,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'lib/core/utils/assets/images/$text.jpg',
              fit: BoxFit.cover,
              height: 280,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            height: 280,
            width: double.infinity,
          )),
          Positioned(
              bottom: 15.0,
              left: 15.0,
              child: Text(
                text,
                style: GoogleFonts.alkatra(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
        ],
      ),
    ),
  );
}
