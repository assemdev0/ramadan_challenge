import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';
import 'package:ramadan_chanllage_1/presentation/resources/assets_manager.dart';

import '/presentation/widgets/home_title_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/strings_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../resources/colors_manager.dart';
import '../widgets/home_slider_widget.dart';
import '../widgets/home_news_list_item_builder_widget.dart';
import 'widgtes/home_success_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsController>(context, listen: false).getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsController>(
      builder:
          (BuildContext context, NewsController controller, Widget? child) {
        if (controller.newsSuccessModel != null) {
          return HomeSuccessWidget(
            controller: controller,
          );
        } else if (controller.newsErrorModel != null) {
          return Center(
            child: Text(
              controller.newsErrorModel!.message!,
              style: TextStyle(color: errorRedColor),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
