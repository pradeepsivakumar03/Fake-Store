import 'dart:developer';
import 'package:hive/hive.dart';
import '../../../products/data/model/product.dart';

abstract interface class LocalDataSource {
  void addProduct({required ProductModel product});
  List<ProductModel> getProducts();
  // void checkProduct();
  void removeProduct({required ProductModel product});
  void updateQuantity({required ProductModel product});
}

class LocalDataSourceImpl implements LocalDataSource {
  final Box box;

  LocalDataSourceImpl({required this.box});
  @override
  List<ProductModel> getProducts() {
    List<ProductModel> cartList = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        cartList.add(ProductModel.fromJson(box[i]));
      }
    });
    return cartList;
  }

  @override
  void removeProduct({required ProductModel product}) {
    box.delete(product.id.toString());
    // box.clear();
  }

  @override
  void addProduct({required ProductModel product}) {
    box.put(product.id.toString(), product);
  }

  @override
  void updateQuantity({required ProductModel product}) async {
    try {
      log(product.quantity.toString());
      box.put(product.id.toString(), product);
    } catch (e) {
      log(e.toString());
    }
  }
}
