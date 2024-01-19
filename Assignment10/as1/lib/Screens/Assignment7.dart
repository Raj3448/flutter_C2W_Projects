import 'package:flutter/material.dart';

class Assignment7 extends StatelessWidget {
  Assignment7({Key? key}) : super(key: key);

  List<String> imageList = [
    "https://images.pexels.com/photos/1168940/pexels-photo-1168940.jpeg",
    "https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww",
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
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
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 100,
                          width: 200,
                          child: Image.network(imageList[index]),
                        ),
                      )))
        ],
      ),
    );
  }
}
