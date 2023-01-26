import 'package:alubank/themes/text_theme.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  brightness: Brightness.dark,
  fontFamily: 'Raleway',
  textTheme: appTextTheme,
);
