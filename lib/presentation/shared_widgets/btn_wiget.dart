import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class BtnWidget extends StatelessWidget {
  final String txt;
  VoidCallback onClicked;
  Color colorBtn;
  double fontSize;
  Color colorTxt;
  double width;
  double height;
  Color borderColor;
  double radius;
  Widget? child;

  BtnWidget(
      {Key? key,
      required this.txt,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.onClicked,
      required this.colorBtn,
      required this.colorTxt,
      this.borderColor = Colors.transparent,
      this.radius = 4,
        this.child
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorBtn,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(
                  width: 1, // the thickness
                  color: borderColor // the color of the border
                  )),
        ),
        child: child??Text(
          txt,
          style: TextStyle(color: colorTxt),
        ),
      ),
    );
  }
}
