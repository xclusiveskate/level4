import 'package:flutter/material.dart';
import 'package:level4/database/note_ui.dart';
// import 'package:level4/localstorage/local_storage.dart';
import 'package:level4/localstorage/user_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const NoteUi(),
    );
  }
}
