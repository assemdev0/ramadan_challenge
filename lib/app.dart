import 'package:flutter/material.dart';
import '/resources/strings_manager.dart';
import '/resources/theme_manager.dart';
import 'news_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      home: NewsScreen(),
    );
  }
}
