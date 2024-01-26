import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Tiranga extends StatefulWidget {
  const Tiranga({super.key});

  @override
  State<Tiranga> createState() => _RowMainAppState();
}

class _RowMainAppState extends State<Tiranga>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _confettiController = ConfettiController();
  late Animation<double> _animation;
  double _startPosition = -50.0;
  double _endPosition = 10.0;
  

  @override
  void initState() {
    super.initState();
    _confettiController.play();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: _startPosition, end: _endPosition)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
              backgroundColor: Colors.green,
              body: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.white, Colors.green],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 20),
                      child: Text(
                        'Tiranga',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromARGB(255, 30, 126, 237),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 40,
                          margin: const EdgeInsets.only(left: 50),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 184, 153, 61),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 600,
                              color: Colors.black,
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 300,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                      Container(
                                        height: 80,
                                        width: 300,
                                        color: Colors.white,
                                        child: Image.asset(
                                          'assets/Images/ashoka-chakra.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Container(
                                          height: 80,
                                          width: 300,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 355,
                                  child: Center(
                                    child: Container(
                                      height: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Opacity(
                                          opacity: _controller.value,
                                          child: Transform.translate(
                                            offset:
                                                Offset(-_animation.value, 0.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: 200,
                                                    child: Image.asset(
                                                        'assets/Images/january.png')),
                                                const Text(
                                                  'Happy Republic Day',
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          ConfettiWidget(
            confettiController: _confettiController,
            shouldLoop: true,
            blastDirection: pi / 2,
          )
        ],
      ),
    );
  }
}
