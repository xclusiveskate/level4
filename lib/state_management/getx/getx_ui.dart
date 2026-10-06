import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level4/state_management/getx/getx.dart';
import 'package:level4/state_management/getx/new_getx.dart';

class GetxUi extends StatefulWidget {
  const new({super.key});

  @override
  State<GetxUi> createState() => _GetxUiState();
}

class _GetxUiState extends State<GetxUi> {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(controller.count.toString())),

          ElevatedButton(
            onPressed: () {
              Get.to(NewGetx());
            },
            child: Text("Go to new page"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increaseValue();
        },
        child: Text("Increase"),
      ),
    );
  }
}
