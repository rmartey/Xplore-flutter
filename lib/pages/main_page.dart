// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xplore/pages/bar_item_page.dart';
import 'package:xplore/pages/home_page.dart';
import 'package:xplore/pages/my_page.dart';
import 'package:xplore/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: ("Bar"), icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: ("Search"), icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: ("My"), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
