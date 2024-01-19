import 'package:flutter/material.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({Key? key}) : super(key: key);

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
                      left: MediaQuery.of(context).size.width * 0.29),
                  child: const Text(
                    'Hello Core2web',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    child: Image.asset('assets/Images/linkedin.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 200,
                    child: Image.asset('assets/Images/loading.gif'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 200,
                    child: Image.asset('assets/Images/Untitled design.png'),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
