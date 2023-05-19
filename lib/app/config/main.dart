import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_cart_app/app/config/routes/get_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop Cart App',
      initialRoute: '/',
      getPages: GetRoutes.routes,
    );
  }
}
