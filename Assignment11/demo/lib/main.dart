import 'dart:convert';

import 'package:demo/services/user_details_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as _HTTP;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List<UserDetails> userDetailsList = [];

  Future<List<UserDetails>> getDataFromApi() async {
    try {
      final response = await _HTTP
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final data = json.decode(response.body.toString());

      if (response.statusCode == 200) {
        for (var i in data) {
          userDetailsList.add(UserDetails.fromJson(i));
        }
      } else {
        print(response);
      }
    } catch (error) {
      print(error.toString());
    }
    return userDetailsList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FutureBuilder(
                  future: getDataFromApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListTile(
                              leading: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    snapshot.data![index].name,
                                  )),
                              title: Column(
                                children: [
                                  Text(snapshot.data![index].toString()),
                                  Text(snapshot.data![index].phone),
                                  Text(snapshot.data![index].username),
                                  Text(snapshot.data![index].website),
                                  Text(snapshot.data![index].address.city),
                                  Text(snapshot.data![index].address.city),
                                  Text(snapshot.data![index].email),
                                  Text(snapshot.data![index].email),
                                ],
                              ),
                            ),
                          );
                        });
                  }))),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.black,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.cyan,
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.black,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.cyan,
//                 )
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
