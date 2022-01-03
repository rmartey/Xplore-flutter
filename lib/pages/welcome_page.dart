// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:xplore/widgets/appText.dart';
import 'package:xplore/widgets/largeText.dart';
import 'package:xplore/widgets/responsive_button.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = [
    "welcomeImage_one.jpg",
    "welcomeImage_two.jpg",
    "welcomeImage_three.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/${images[index]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Moutain hikes gives you an incredible sense of freedome along with endurance teste.",
                            size: 14,
                            // color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: EdgeInsets.only(bottom: 3),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? Colors.deepPurple[500]
                                        : Colors.deepPurple[500]
                                            ?.withOpacity(0.3)),
                              )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
