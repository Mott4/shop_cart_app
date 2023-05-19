import 'package:get/get.dart';
import 'package:shop_cart_app/app/model/item_model.dart';
import 'package:shop_cart_app/app/utils/extensions.dart';

class CartController extends GetxController {
  RxDouble total = 0.0.obs;

  final _items = RxList<ItemModel>([]).obs;

  List<ItemModel> get items {
    return _items.value;
  }

  String getTotal() {
    double total = 0.0;
    for (var item in items) {
      total += item.price;
    }
    return total.toBrazilianCurrency();
  }

  void setList(List<ItemModel> list) {
    _items.value.clear();
    _items.value.addAll(list);
  }

  void removeProduct(ItemModel product) {
    _items.value.remove(product);
  }

  void addProduct(ItemModel product) {
    final itemModel = ItemModel(name: product.name, price: product.price);
    items.add(itemModel);

    if (!items.any((item) => item.name == itemModel.name && item.price == itemModel.price)) {
      _items.value.add(itemModel);
    }
  }

  editProduct(ItemModel item, int index) {
    _items.value[index] = item;
  }
}
