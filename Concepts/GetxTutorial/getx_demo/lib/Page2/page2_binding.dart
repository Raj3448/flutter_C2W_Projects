import 'package:get/get.dart';
import 'package:getx_demo/Page2/page2_controller.dart';
//used for initialiazing all controller for page12
class Page2Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Page2Controller());
  }
}