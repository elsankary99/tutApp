import 'package:flutter/material.dart';
import 'package:tutapp/presentation/color_managar.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main color
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1);
}
