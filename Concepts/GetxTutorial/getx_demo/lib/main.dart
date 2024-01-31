import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Page1/Page1_view.dart';
import 'package:getx_demo/Page1/page1_binding.dart';
import 'package:getx_demo/Page2/page2_binding.dart';
import 'package:getx_demo/Page2/page2_view.dart';
import 'package:getx_demo/ScreenA.dart';
import 'package:getx_demo/controller/CounterController.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  //var myController = Get.put(MyCounter());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: AllBinding(), //UserDefined class used for binding all the controller at a time and access the controller by using find() in all over class
      getPages: [
        GetPage(name: '/', page: ()=> const Main()),
        GetPage(name: '/page1', page: () => Page1View(),binding: Page1Binding()),
        GetPage(name: '/page2', page: () => Page2View(),binding: Page2Binding())
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  print(await Get.to(() => const ScreenA(),
                      arguments: "Raj here"));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      children: [
                        GetX<MyCounter>(
                          init: MyCounter(),
                          builder: (myCouneterInstance) {
                            return Text(myCouneterInstance.count.toString());
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              var myCounterInstance2 = Get.find<MyCounter>();
                              myCounterInstance2.incrementCounter();
                            },
                            child: const Text('Add'))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
