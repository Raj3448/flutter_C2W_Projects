import 'package:get/get.dart';
import 'package:getx_demo/Page1/page1_controller.dart';


//used for initialiazing all controller for page1
class Page1Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Page1Controller());
  }
}