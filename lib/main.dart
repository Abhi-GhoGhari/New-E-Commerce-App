import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/utils/route_utils.dart';
import 'package:new_ecommerce_app/view/screen/cart_page.dart';
import 'package:new_ecommerce_app/view/screen/detials_page.dart';
import 'package:new_ecommerce_app/view/screen/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
