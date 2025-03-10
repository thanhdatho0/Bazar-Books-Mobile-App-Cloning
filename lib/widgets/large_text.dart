import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  //Properties
  Color? color;
  FontWeight? fontWeight;
  final String text;
  double size;
  TextOverflow? textOverflow;
  TextAlign? textAlign;

  //Constructor
  LargeText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.size = 0,
      this.textOverflow = TextOverflow.visible,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      overflow: textOverflow,
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontWeight: fontWeight,
          fontSize: size == 0 ? 16 : size,
          decoration: TextDecoration.none),
    );
  }
}
