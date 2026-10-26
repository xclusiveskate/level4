import 'package:flutter/material.dart';
import 'package:level4/routes/cart_page.dart';
import 'package:level4/routes/checkout_page.dart';
import 'package:level4/routes/login.dart';
import 'package:level4/routes/unknown.dart';
import 'package:path/path.dart';

class RouteSetup {
  static MaterialPageRoute<dynamic> onGenerate({
    required RouteSettings settings,
  }) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case CartPage.routeName:
        if (args is! Map<String, dynamic>) {
          return MaterialPageRoute(builder: (context) => UnknownPage());
        }
        return MaterialPageRoute(builder: (context) => CartPage(data: args));
      case CheckoutPage.routeName:
        if (args is! double) {
          return MaterialPageRoute(builder: (context) => UnknownPage());
        }
        return MaterialPageRoute(
          builder: (context) => CheckoutPage(totalAmount: args),
        );
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage());
    }
  }
}
