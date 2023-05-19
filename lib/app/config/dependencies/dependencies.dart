import 'package:get/get.dart';
import 'package:shop_cart_app/app/config/controllers/cart_controller.dart';

dependencies() {
  Get.lazyPut(() => CartController());
}
