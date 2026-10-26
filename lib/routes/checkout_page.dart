import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = "/checkout";
  final double totalAmount;
  const CheckoutPage({super.key, required this.totalAmount});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout page")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text(" Go to new page")),
        ],
      ),
    );
  }
}
