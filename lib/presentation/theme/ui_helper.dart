import 'package:flutter/material.dart';

bool isKeyboardOpen(BuildContext context) =>
    WidgetsBinding.instance.window.viewInsets.bottom != 0.0;
