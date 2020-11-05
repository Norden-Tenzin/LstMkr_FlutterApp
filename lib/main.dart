import 'package:flutter/material.dart';
import "home.dart";
import "postPage.dart";
// https://projects.invisionapp.com/freehand/document/fPp2CdfuH

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => MyHomePage(),
      "/post": (context) => PostPage(),
    },
  ));
}
