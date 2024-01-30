import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/ScreenA.dart';
import 'package:getx_demo/controller/CounterController.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  //var myController = Get.put(MyCounter());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
