import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Page2/page2_controller.dart';

class Page2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.find<Page2Controller>().title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                //Get.back(result: "From Raj");
                Get.offAll('/');
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Add'))
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
