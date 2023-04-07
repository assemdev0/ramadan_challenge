import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';
import '/presentation/resources/routes_manager.dart';
import 'presentation/resources/strings_manager.dart';
import 'presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsController()),
      ],
      child: MaterialApp(
        title: appName,
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.home,
      ),
    );
  }
}
