import 'package:flutter/material.dart';

import 'color.dart';


var lighttheme = ThemeData(
    colorScheme: ColorScheme.light(
  surface: lBackgroundColor,
  onSurface: lTextColor,
  primary: lContanerColor,
));

var darktheme = ThemeData(
    colorScheme: ColorScheme.dark(
  surface: dBackgroundColor,
  onSurface: dTextColor,
  primary: dContanerColor,
));
