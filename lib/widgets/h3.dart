import 'package:flutter/material.dart';

class H3 extends StatelessWidget {
  //Properties
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  final String text;
  double size;
  TextOverflow? textOverflow;

  //Constructor
  H3(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold,
      this.size = 0,
      this.textOverflow = TextOverflow.visible,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Open Sans',
        color: color,
        fontWeight: fontWeight,
        fontSize: size == 0 ? 24 : size,
        decoration: TextDecoration.none,
      ),
    );
  }
}
