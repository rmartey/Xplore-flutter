// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xplore/cubit/app_cubit.dart';
import 'package:xplore/cubit/app_cubit_states.dart';
import 'package:xplore/widgets/appText.dart';
import 'package:xplore/widgets/app_buttons.dart';
import 'package:xplore/widgets/largeText.dart';
import 'package:xplore/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  int gottenStar = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                          detail.place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$ " + detail.place.price.toString(),
                            color: Colors.indigo.shade400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.indigo.shade400,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: detail.place.location,
                            color: Colors.indigo.shade400,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? Colors.amber.shade400
                                    : Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(text: "(5.0)")
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.7),
                        size: 22,
                      ),
                      AppText(text: "Number of people in your group"),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                size: 60,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey.shade300,
                                borderColor: Colors.grey.shade300,
                                text: (index + 1).toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.7),
                        size: 24,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppText(
                        text: detail.place.description,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButton(
                      size: 60,
                      color: Colors.deepPurple.shade400,
                      backgroundColor: Colors.white,
                      borderColor: Colors.deepPurple.shade400,
                      isICon: true,
                      icon: Icons.favorite_outline,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                      // width: 120,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
