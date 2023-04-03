import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/presentation/resources/routes_manager.dart';
import 'presentation/resources/strings_manager.dart';
import 'presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.home,
    );
  }
}
