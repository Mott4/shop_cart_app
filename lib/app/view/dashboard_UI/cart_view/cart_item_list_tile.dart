import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart_app/app/config/controllers/cart_controller.dart';
import 'package:shop_cart_app/app/model/item_model.dart';
import 'package:shop_cart_app/app/utils/extensions.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/components/show_dialog_form.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/components/show_dialog_message.dart';

class CartItemWidget extends StatefulWidget {
  final int index;
  final ItemModel item;

  const CartItemWidget({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final CartController _controller = Get.find();
  ItemModel get item => _controller.items[widget.index];

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog<bool?>(
          context: context,
          builder: (ctx) => ShowDialogMessage(
            title: 'Deseja remover o item do carrinho?',
            confirmButtonText: 'Sim',
            cancelButtonText: 'Não',
            onConfirmedPressed: () {
              _controller.removeProduct(item);
            },
          ),
        );
      },
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: const Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name),
              Row(
                children: [
                  Chip(label: Text(item.price.toBrazilianCurrency())),
                  const Icon(Icons.delete_sweep),
                ],
              ),
            ],
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => ProductForm(index: widget.index, item: _controller.items[widget.index]),
          ),
        ),
      ),
    );
  }
}
