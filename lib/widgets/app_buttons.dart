// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:xplore/widgets/appText.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isICon;
  AppButton(
      {Key? key,
      this.isICon = false,
      this.text = "hi",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: isICon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
