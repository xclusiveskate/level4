import 'package:flutter/material.dart';
import 'package:level4/state_management/provider/user_provider.dart';
import 'package:provider/provider.dart';

class NewUI extends StatefulWidget {
  const new({super.key});

  @override
  State<NewUI> createState() => _NewUIState();
}

class _NewUIState extends State<NewUI> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("New Ui")),
      body: Center(child: Text(pro.counter.toString())),
    );
  }
}
