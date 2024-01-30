import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/CounterController.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.back(result: "From Raj");
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
                child: Column(
                  children: [
                    GetBuilder<MyCounter>(
                      init: MyCounter(),
                      builder: (myCouneterInstance) {
                        return Text(
                          "${myCouneterInstance.count} ${Get.arguments}",
                          style: const TextStyle(color: Colors.white),
                        );
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
          ],
        ),
      ),
    );
  }
}
