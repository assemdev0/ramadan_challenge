import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/strings_manager.dart';

import 'colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // mainColors
    primarySwatch: primarySwatchColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryLight,
    primaryColorDark: primaryDark,
    disabledColor: disabledColor,
    splashColor: primaryLight,
    scaffoldBackgroundColor: whiteColor,
    fontFamily: fontFamily,

    // cardTheme

    // app bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: titleTextColor),
      actionsIconTheme: IconThemeData(color: titleTextColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    iconTheme: IconThemeData(color: titleTextColor),

    // buttons Theme

    //elevated Button Theme

    // textTheme

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding

        // hint text style

        // label text style

        //error text style

        //enabled border style

        //focused border style

        //disabled border style

        //error border style

        //focused error border style

        ),
  );
}
