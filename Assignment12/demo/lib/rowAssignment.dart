import 'package:flutter/material.dart';

class RowMainApp extends StatelessWidget {
  const RowMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  color: Colors.black,
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          )),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 300,
                            color: Colors.white,
                            child: Image.asset(
                              'assets/Images/ashoka-chakra.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
