import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_cart_app/app/config/routes/app_routes.dart';
import 'package:shop_cart_app/app/view/auth_UI/login-view/login_view.dart';
import 'package:shop_cart_app/app/view/dashboard_UI/cart_view/cart_view.dart';

class GetRoutes {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: AppRoutes.mainRoute, page: () => CartView()),
    GetPage(name: AppRoutes.mainRoute, page: () => const LoginView()),
  ];
}
