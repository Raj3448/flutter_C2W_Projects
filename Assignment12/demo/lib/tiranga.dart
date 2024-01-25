import 'package:flutter/material.dart';

class Tiranga extends StatelessWidget {
const Tiranga({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 500,
              color: Colors.black,
              width: 3,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 250,
                  color: Colors.orange,
                ),
                Container(
                  height: 100,
                  width: 250,
                  color: Colors.white,
                ),
                Container(
                  height: 100,
                  width: 250,
                  color: Colors.green,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}