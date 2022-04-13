import 'package:flutter/material.dart';

abstract class Spacing {
  static SizedBox get textFieldSpacing => SizedBox(height: 12);
  static SizedBox get textFieldOuterSpacing => SizedBox(height: 23);
  static SizedBox get resultComputationSpacing => SizedBox(height: 30);
  static SizedBox get bottomWidgetSpacing => SizedBox(height: 10);
}
