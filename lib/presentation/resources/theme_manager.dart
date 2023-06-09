import 'package:flutter/material.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/font_manager.dart';
import 'package:tutapp/presentation/resources/styles_manager.dart';
import 'package:tutapp/presentation/resources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //*  main color
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,

      //* cardView theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      //* appBar Theme
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

      //*button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary),

      //* elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)),
          textStyle: getRegularTextStyle(
              color: ColorManager.white, fontSize: FontSize.s17),
        ),
      ),
      // * text theme
      textTheme: TextTheme(
          displayLarge: getSemiBoldTextStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16), //?used
          headlineLarge: getSemiBoldTextStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          headlineMedium: getRegularTextStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s14), //?used
          titleMedium: getMediumTextStyle(
              color: ColorManager.primary, fontSize: FontSize.s16), //?used
          bodyLarge: getRegularTextStyle(color: ColorManager.grey1),
          bodySmall: getRegularTextStyle(color: ColorManager.grey)),
      // input decoration theme (text form field)

      ////! inputDecorationTheme (Text Form Field )/////

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularTextStyle(
            color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle: getMediumTextStyle(
            color: ColorManager.grey, fontSize: FontSize.s14),

        errorStyle: getRegularTextStyle(color: ColorManager.error),
        //* enabledBorder
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //* focusedBorder
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // * errorBorder
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //* focusedErrorBorder
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
