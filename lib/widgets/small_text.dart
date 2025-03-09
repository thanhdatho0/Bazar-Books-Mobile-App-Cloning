import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  //Properties
  Color? color;
  FontWeight? fontWeight;
  final String text;
  double size;
  TextOverflow? textOverflow;

  //Constructor
  SmallText(
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
          color: color,
          fontWeight: fontWeight,
          fontSize: size == 0 ? 12 : size,
          decoration: TextDecoration.none),
    );
  }
}
