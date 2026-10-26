import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({super.key});

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unknown page")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text(" Go to login page")),
        ],
      ),
    );
  }
}
