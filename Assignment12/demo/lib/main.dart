import 'package:demo/rowAssignment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RowMainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(height: 100, width: 100, color: Colors.red),
                    Container(height: 100, width: 100, color: Colors.green),
                    Container(height: 100, width: 100, color: Colors.blue)
                  ]))),
    );
  }
}
