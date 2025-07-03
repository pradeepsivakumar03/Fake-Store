import 'package:fake_store/Features/category/presentation/controllers/category_controller.dart';
import 'package:fake_store/core/utils/formats/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
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
                      "Categories",
                      style: GoogleFonts.greatVibes(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 4.0),
                  //   child: Image.asset(
                  //     'lib/core/utils/assets/icons/category.png',
                  //     height: 25,
                  //     width: 25,
                  //   ),
                  // )
                ],
              ),
              Obx(() {
                return categoryController.isLoading.isTrue
                    ? const Padding(
                        padding: EdgeInsets.only(top: 300),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            itemCount: categoryController.categoryList.length,
                            itemBuilder: (context, index) {
                              return categoryCard(
                                  text: capitalizeEachWord(
                                      categoryController.categoryList[index]));
                            }),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
