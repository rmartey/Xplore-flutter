// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xplore/widgets/appText.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.isResponsive = false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.indigo[400],
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 8,
            ),
            // Image.asset("assets/arrow3.jpg"),
            isResponsive == false
                ? Text(
                    ">>>",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      ">>>",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
