import 'package:flutter/material.dart';
import 'package:zapx/zapx.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff500370),
      body: Column(
        children: [
          Container(
            height: screenSize.height * 0.3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffC50462), Color(0xff500370)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Image.asset(
              'assets/images/Group 4911.png',
              fit: BoxFit.contain,
              height: 100,
            ).paddingSymmetric(horizontal: 20),
          ),
          Container(
            height: screenSize.height * 0.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              children: [
                Container(
                  height: screenSize.height * 0.7,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Image.asset(
                          'assets/images/Group 5306.png',
                          height: 100,
                          fit: BoxFit.cover)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
