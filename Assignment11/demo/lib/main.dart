import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyan,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
