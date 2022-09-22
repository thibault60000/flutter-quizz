import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      this.color = Colors.white,
      this.textAlign = TextAlign.left});

  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textScaleFactor: size,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
