import 'package:flutter/material.dart';

import 'font_manager.dart';
import 'strings_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// light style
TextStyle getLightTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// regular style
TextStyle getRegularTextStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

// medium style
TextStyle getMediumTextStyle({
  double fontSize = FontSizeManager.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

// semiBold style
TextStyle getSemiBoldTextStyle({
  double fontSize = FontSizeManager.s20,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

// bold style
TextStyle getBoldTextStyle({
  double fontSize = FontSizeManager.s30,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}
