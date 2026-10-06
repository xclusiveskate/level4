import 'package:get/state_manager.dart';

class Controller extends GetxController {
  RxInt count = 0.obs;

  increaseValue() {
    count++;
  }
}
