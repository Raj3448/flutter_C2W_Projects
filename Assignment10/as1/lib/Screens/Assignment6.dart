import 'package:flutter/material.dart';

class Assignment6 extends StatelessWidget {
  Assignment6({Key? key}) : super(key: key);

  List<Color> colorList = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.deepOrange,
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.35),
                  child: const Text(
                    'Title here',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: const SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                ),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                  itemCount: colorList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 100,
                          width: 200,
                          color: colorList[index],
                        ),
                      )))
        ],
      ),
    );
  }
}
