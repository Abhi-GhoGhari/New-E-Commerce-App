import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _Cart_productState();
}

class _Cart_productState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cart Item's"),
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              height: 100,
              width: 200,
              color: Colors.red,
            ),
          )),
    );
  }
}
