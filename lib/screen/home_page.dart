import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

import 'content_screen.dart';
import 'models/reelmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Insta>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://www.xynie.com/feeds/short-videos-app/page/0'));

    if (response.statusCode == 200) {
      print(response.body);
      for (var item in json.decode(response.body)) {
        for (var item2 in item["vimeo"]) {
          videos.add(item2["link"]);
        }
      } // Rest of the items
      print("AJAYAJAY" + videos.elementAt(2));
      Iterable l = json.decode(response.body);
      return List<Insta>.from(l.map((model) => Insta.fromJson(model)));

      // If the call to the server was successful, parse the JSON
      //  Insta.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  // Future<List<Insta>> fetchAlbum() async {
  //   final response = await http
  //       .get(Uri.parse('https://www.xynie.com/feeds/short-videos-app/page/0'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return List<Insta>.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  final List<String> videos = [];

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child:
          //We need swiper for every content
          Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ContentScreen(
            src: videos[index],
          );
        },
        itemCount: videos.length,
        scrollDirection: Axis.vertical,
      ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'Flutter Shorts',
      //         style: TextStyle(
      //           fontSize: 22,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       Icon(Icons.camera_alt),
      //     ],
      //   ),
      // ),
    )));
  }
}
