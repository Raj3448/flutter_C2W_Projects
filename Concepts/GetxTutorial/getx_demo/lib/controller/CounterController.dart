import 'package:get/get.dart';

class MyCounter extends GetxController {
  RxInt count = 0.obs; // for reactive state management
  void incrementCounter() {
    count++;
    update();
    // when we use GetBuilder widget the we have must update the state like this
    // for simpler state management
  }

  void onInit() {
    //called every time when the count is changes
    ever(count, (callback) => print("ever"));

    //we can perform the event when the multiple state is update => called every time.
    everAll([
      count,
    ], (callback) => print('ever'));

    once(count,
        (callback) => print("Print the line when the state is changes once"));

    //perform the action after timestampa when the state is changes

    debounce(count, (callback) => print("After 3 sec I am hare"),time: const Duration(seconds: 3));

    super.onInit();
  }
}