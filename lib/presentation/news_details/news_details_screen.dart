import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';
import 'package:ramadan_chanllage_1/models/news_item_model.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsController>().itemNewsItemIndex =
        ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<NewsController>(
      builder:
          (BuildContext context, NewsController controller, Widget? child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBarWidget(
                  item: context.read<NewsController>().newsItems[
                      context.read<NewsController>().itemNewsItemIndex],
                  onBackPress: () {
                    controller.onBackPress(context);
                  },
                  onBookmarkPress: () {
                    controller.changeFavoriteState(
                      context.read<NewsController>().itemNewsItemIndex,
                    );
                  },
                  onMorePress: () {},
                ),
              ];
            },
            body: DefaultPaddingWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      context
                          .read<NewsController>()
                          .newsItems[
                              context.read<NewsController>().itemNewsItemIndex]
                          .body,
                      style: getMediumTextStyle(
                        color: titleTextColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
