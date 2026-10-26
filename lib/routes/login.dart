import 'package:flutter/material.dart';
import 'package:level4/localstorage/user_model.dart';
import 'package:level4/routes/cart_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Column(
        children: [
          AnimatedContainer(duration: Duration(milliseconds: 300), curve: Curves.bounceOut,),
          ElevatedButton(
            onPressed: () {
             
              Navigator.pushNamed(
                context,
                CartPage.routeName,
                // arguments: UserModel(
                //   id: id,
                //   name: name,
                //   school: school,
                //   address: address,
                // ),
              );
            },
            child: Text(" Go to next page"),
          ),
        ],
      ),
    );
  }
}
