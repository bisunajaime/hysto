import 'package:flutter/material.dart';

class CPCText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? size;
  final Color? color;
  const CPCText(this.text, {Key? key, this.fontWeight, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 16.0,
        color: color ?? Colors.black,
      ),
    );
  }
}
