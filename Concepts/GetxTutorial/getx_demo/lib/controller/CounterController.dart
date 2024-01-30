import 'package:get/get.dart';

class MyCounter extends GetxController {
  RxInt count = 0.obs; // for reactive state management
  void incrementCounter() {
    count++;
    update();  //when we use GetBuilder widget the we have must update the state like this
    //for simpler state management
  }
}
