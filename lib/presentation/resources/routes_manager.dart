import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/presentation/home_layout/home_layout.dart';
import 'package:ramadan_chanllage_1/presentation/news_details/news_details_screen.dart';

class RoutesManager {
  // Home
  static const String home = '/home';

  // News
  static const String newsDetailsScreen = '/newsDetailsScreen';

  static Map<String, WidgetBuilder> routes = {
    // Home
    home: (context) => const HomeLayout(),

    // News
    newsDetailsScreen: (context) => NewsDetailsScreen(),
  };
}
