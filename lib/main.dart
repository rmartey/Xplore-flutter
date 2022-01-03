// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xplore/pages/details_page.dart';
import 'package:xplore/pages/main_page.dart';
import 'package:xplore/pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyAPp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xplore",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DetailPage(),
    );
  }
}
