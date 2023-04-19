import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';
import 'package:ramadan_chanllage_1/models/top_headlines_model/top_headlines_success_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsController>().itemNewsItem =
        ModalRoute.of(context)!.settings.arguments as Articles;
    return Consumer<NewsController>(
      builder:
          (BuildContext context, NewsController controller, Widget? child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBarWidget(
                  item: context.read<NewsController>().itemNewsItem,
                  onBackPress: () {
                    controller.onBackPress(context);
                  },
                  onBookmarkPress: () {
                    controller.changeFavoriteState(
                      context.read<NewsController>().itemNewsItem.id!,
                    );
                  },
                  onMorePress: () {},
                ),
              ];
            },
            body: DefaultPaddingWidget(
              child: Column(
                children: [
                  if (controller.onProgrees != 100)
                    LinearProgressIndicator(
                      value: controller.onProgrees / 100,
                      backgroundColor: whiteColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        primaryColor,
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: WebView(
                      // controller: context.read<NewsController>().controller,
                      initialUrl:
                          context.read<NewsController>().itemNewsItem.url!,
                      onProgress: (progress) {
                        controller.onProgreesChange(progress);
                      },
                      allowsInlineMediaPlayback: true,

                      javascriptMode: JavascriptMode.unrestricted,
                      zoomEnabled: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
