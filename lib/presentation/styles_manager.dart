import 'package:flutter/material.dart';
import 'package:tutapp/presentation/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular style
TextStyle getRegularTextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWightManager.regular, color);
}

//medium style
TextStyle getMediumTextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWightManager.medium, color);
}

//light style
TextStyle getLightTextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWightManager.light, color);
}

//semiBold style
TextStyle getSemiBoldTextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWightManager.semiBold, color);
}

//bold style
TextStyle getBoldTextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWightManager.bold, color);
}
