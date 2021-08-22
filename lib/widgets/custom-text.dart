import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool isBold;
  final double ls;
  final TextAlign align;
  const CustomText(
      {Key key,
      this.text,
      this.size,
      this.color = Colors.black,
      this.isBold = false,
      this.ls,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        height: ls,
      ),
      textAlign: align,
    );
  }
}
