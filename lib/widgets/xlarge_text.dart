import 'package:flutter/material.dart';

class XLargeText extends StatelessWidget {
  //Properties
  Color? color;
  FontWeight? fontWeight;
  final String text;
  double size;
  TextOverflow? textOverflow;

  //Constructor
  XLargeText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.size = 0,
      this.textOverflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: fontWeight,
          color: color,
          fontSize: size == 0 ? 18 : size,
          decoration: TextDecoration.none),
    );
  }
}
