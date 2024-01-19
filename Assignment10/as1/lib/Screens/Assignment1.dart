import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Title Here'),
        actions: const [
          Icon(
            Icons.manage_search_outlined,
            size: 30,
          ),
          Icon(
            Icons.notifications_active,
            size: 30,
          )
        ],
      ),
      body: Container(),
    );
  }
}
