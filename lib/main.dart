import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level4/database/note_ui.dart';
import 'package:level4/state_management/getx/getx_ui.dart';
import 'package:level4/state_management/provider/provider_ui.dart';
import 'package:level4/state_management/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const GetxUi(),
    );
  }
}
