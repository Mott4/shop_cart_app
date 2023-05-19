import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart_app/app/config/controllers/cart_controller.dart';
import 'package:shop_cart_app/app/model/item_model.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/cart_item_list_tile.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/components/cart_search.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/components/show_dialog_form.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartController _controller = Get.find();

  void _openProductForm() {
    Get.dialog(const ProductForm());
  }

  @override
  void initState() {
    List<ItemModel> items = [
      // ItemModel(name: 'Vinho', price: 19.99),
      // ItemModel(name: 'TV', price: 3000.99),
      // ItemModel(name: 'Chocolate', price: 6.49),
      // ItemModel(name: 'Sabão em Pó', price: 4.99),
      // ItemModel(name: 'Leite', price: 7.00),
    ];

    items.sort((a, b) {
      return b.price.compareTo(a.price);
    });

    _controller.setList(items);
    super.initState();
  }

  bool isOnSearch = false;
  String text = '';

  setOnSearchValue(bool value) => setState(() => isOnSearch = value);
  setSearchValue(String value) => setState(() => text = '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // Botão de pesquisa ===================================================
        title: !isOnSearch
            ? const Text('Shop Cart')
            : CartSearch(
                setOnSearchValue: setOnSearchValue,
                setSearchValue: setSearchValue,
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => setOnSearchValue(!isOnSearch),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openProductForm();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Lista de Produtos =================================================
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, i) => CartItemWidget(item: _controller.items[i], index: i),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // PREÇO FINAL ===============================================
                  const Text('VALOR TOTAL', style: TextStyle(fontSize: 20)),
                  Obx(
                    () => Chip(
                      backgroundColor: Colors.blueGrey,
                      label: Text(
                        'R\$ ${_controller.getTotal()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
