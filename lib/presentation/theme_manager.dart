import 'package:flutter/material.dart';
import 'package:tutapp/presentation/color_manager.dart';
import 'package:tutapp/presentation/font_manager.dart';
import 'package:tutapp/presentation/styles_manager.dart';
import 'package:tutapp/presentation/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    //cardView theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // appBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      elevation: AppSize.s4,
      titleTextStyle: getRegularTextStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),
  );
}
