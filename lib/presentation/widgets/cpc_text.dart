import 'package:flutter/material.dart';

class CPCText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? size;
  final Color? color;
  final int? maxLines;
  final FontStyle? fontStyle;
  const CPCText(
    this.text, {
    Key? key,
    this.fontWeight,
    this.size,
    this.color,
    this.maxLines,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 999,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 16.0,
        color: color ?? Colors.black,
        overflow: TextOverflow.ellipsis,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
