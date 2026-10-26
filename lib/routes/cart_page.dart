import 'package:flutter/material.dart';
import 'package:level4/localstorage/user_model.dart';

class CartPage extends StatefulWidget {
  static const String routeName = "/cart";
  final Map<String, dynamic> data;
  const CartPage({super.key, required this.data});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    // final datas = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(title: Text("Cart page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName, arguments: 2000);
            },
            child: Text(" Go to another page"),
          ),
        ],
      ),
    );
  }
}
