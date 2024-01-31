import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Page1/page1_controller.dart';

class Page1View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.find<Page1Controller>().title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                //Get.back(result: "From Raj");
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/page2');
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
