import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  //Properties
  Color? color;
  FontWeight? fontWeight;
  final String text;
  double size;
  TextOverflow? textOverflow;

  //Constructor
  H1(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold,
      this.size = 0,
      this.textOverflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      style: TextStyle(
          fontFamily: 'Open Sans',
          color: color,
          fontWeight: fontWeight,
          fontSize: size == 0 ? 40 : size,
          decoration: TextDecoration.none),
    );
  }
}
