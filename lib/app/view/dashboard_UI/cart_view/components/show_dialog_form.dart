import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart_app/app/config/controllers/cart_controller.dart';
import 'package:shop_cart_app/app/model/item_model.dart';
import 'package:shop_cart_app/app/validators/validators.dart';

class ProductForm extends StatefulWidget {
  final ItemModel? item;
  final int? index;

  const ProductForm({super.key, this.index, this.item}) : assert(item != null && index != null || item == null && index == null);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final CartController _cartController = Get.find<CartController>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      _nameController.text = widget.item!.name;
      _priceController.text = widget.item!.price.toString();
    }
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final productName = _nameController.text;
      final productPrice = double.parse(_priceController.text);

      final product = ItemModel(name: productName, price: productPrice);
      _cartController.addProduct(product);

      Get.back();
      _nameController.clear();
      _priceController.clear();

      _cartController.items.sort((a, b) => b.price.compareTo(a.price));
    }
  }

  void _editItem() {
    if (_formKey.currentState!.validate()) {
      final productName = _nameController.text;
      final productPrice = double.parse(_priceController.text);

      final product = ItemModel(name: productName, price: productPrice);
      _cartController.editProduct(product, widget.index!);

      Get.back();
      _nameController.clear();
      _priceController.clear();

      _cartController.items.sort((a, b) => b.price.compareTo(a.price));
    }
  }

  _productForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome do Produto'),
            validator: Validators.productNameIsValid,
          ),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Preço do Produto'),
            validator: Validators.isProductPriceValid,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Produto'),
      content: _productForm(),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancelar'),
        ),
        widget.item == null
            ? TextButton(
                onPressed: _submitForm,
                child: const Text('Adicionar'),
              )
            : TextButton(
                onPressed: _editItem,
                child: const Text('Editar'),
              )
      ],
    );
  }
}
