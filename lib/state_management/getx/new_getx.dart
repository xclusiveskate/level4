import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level4/state_management/getx/getx.dart';

class NewGetx extends StatefulWidget {
  const NewGetx({super.key});

  @override
  State<NewGetx> createState() => _NewGetxState();
}

class _NewGetxState extends State<NewGetx> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() => Text(controller.count.toString()))),
    );
  }
}
