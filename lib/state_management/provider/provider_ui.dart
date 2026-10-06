import 'package:flutter/material.dart';
import 'package:level4/state_management/newui.dart';
import 'package:level4/state_management/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserUI extends StatefulWidget {
  const new({super.key});

  @override
  State<UserUI> createState() => _UserUIState();
}

class _UserUIState extends State<UserUI> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return Text(value.counter.toString());
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewUI()),
                );
              },
              child: Text("Go to next page"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          prov.increaseCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
