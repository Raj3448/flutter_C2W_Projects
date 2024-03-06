import 'package:demo_ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:zapx/zapx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _searchFocusNode = FocusNode();
  List<String> imageList = ['UI/UX', 'Visual', 'Illusaration', 'Photo'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffCDDADA),
      body: Column(
        children: [
          Container(
            color: const Color(0xffCDDADA),
            height: screenSize.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/menu.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/bell.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Text(
                  'WelCome to New',
                  textAlign: TextAlign.left,
                  style: AppTheme.copyWith(color: Colors.black, fontSize: 20),
                ),
                Text(
                  'Educourse',
                  textAlign: TextAlign.left,
                  style: AppTheme.copyWith(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    child: TextFormField(
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search,
                              size: 30, color: Colors.white),
                          prefixIconColor: Colors.black,
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0.01),
                              borderRadius: BorderRadius.circular(40)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0.01),
                              borderRadius: BorderRadius.circular(40))),
                      onFieldSubmitted: (value) {
                        _searchFocusNode.unfocus();
                      },
                    ),
                  ),
                ),
              ],
            ).paddingOnly(top: 40, left: 20, right: 20),
          ),
          Container(
            height: screenSize.height * 0.7,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Course for you',
                  style: AppTheme.copyWith(color: Colors.black, fontSize: 25),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(right: 10),
                            //height: 300,
                            width: 200,
                            child: Image.asset(
                                'assets/images/Course Card 1.png',
                                fit: BoxFit.contain),
                          )),
                ),
                Text(
                  'Course by category',
                  style: AppTheme.copyWith(color: Colors.black, fontSize: 25),
                ).paddingOnly(bottom: 20),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(right: 10),
                            height: 70,
                            width: 95,
                            child: Column(
                              children: [
                                Image.asset('assets/images/Rectangle 2575.png',
                                        height: 70, fit: BoxFit.contain)
                                    .paddingOnly(right: 10),
                                Text(imageList[index]),
                              ],
                            ),
                          )),
                ),
                // SizedBox(
                //     height: 200,
                //     //width: 200,
                //     child: PageView.builder(
                //         pageSnapping: true,
                //         itemCount: 5,
                //         physics: const BouncingScrollPhysics(),
                //         onPageChanged: (value) {
                //           currentIndex = value;
                //           setState(() {});
                //         },
                //         itemBuilder: (context, index) {
                //           return Container(
                //               // margin:
                //               //     const EdgeInsets.symmetric(horizontal: 10),
                //               decoration: BoxDecoration(
                //                 //color: Colors.amber,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               clipBehavior: Clip.antiAlias,
                //               child: Image.asset(
                //                   'assets/images/Course Card 1.png',
                //                   fit: BoxFit.contain));
                //         })),
                // CarouselSlider(
                //     items: [0, 1, 2, 3, 4]
                //         .map((e) => Container(
                //             margin: const EdgeInsets.symmetric(horizontal: 10),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //             clipBehavior: Clip.antiAlias,
                //             child: Image.asset(
                //                 'assets/images/Course Card 1.png',
                //                 fit: BoxFit.contain)))
                //         .toList(),
                //     options: CarouselOptions())
              ],
            ).paddingSymmetric(horizontal: 20),
          )
        ],
      ),
    );
  }
}
