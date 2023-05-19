import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart_app/app/model/item_model.dart';

class ProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void addProduct() {
    final productName = nameController.text;
    final productPrice = double.parse(priceController.text);

    // objeto
    final product = ItemModel(name: productName, price: productPrice);

    // Exibir uma mensagem informando que o produto foi adicionado
    Get.dialog(
      AlertDialog(
        title: const Text('Produto Adicionado'),
        content: Text('Nome: ${product.name}\nPreço: ${product.price}'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // Limpar os campos do formulário
    nameController.clear();
    priceController.clear();
  }
}
