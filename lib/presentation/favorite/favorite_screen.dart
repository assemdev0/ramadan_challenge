import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';

import 'package:ramadan_chanllage_1/presentation/resources/styles_manager.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../widgets/home_news_list_item_builder_widget.dart';
import '../widgets/overlayd_dissmissed_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsController>(context, listen: false).getFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<NewsController>().isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      if (context.read<NewsController>().favoriteList.isEmpty) {
        return Center(
          child: Text(
            noFavoriteNews,
            style: getBoldTextStyle(color: titleTextColor),
          ),
        );
      } else {
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (BuildContext context, int index) {
            return DismissibleTile(
              key: Key(
                context
                    .read<NewsController>()
                    .favoriteList[index]
                    .id
                    .toString(),
              ),
              direction: DismissibleTileDirection.horizontal,
              onDismissed: (direction) {
                context.read<NewsController>().deleteFavoriteItem(
                      index: index,
                      id: context.read<NewsController>().favoriteList[index].id,
                    );
              },
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              delayBeforeResize: const Duration(milliseconds: 500),
              ltrDismissedColor: errorRedColor,
              rtlDismissedColor: errorRedColor,
              ltrOverlay: const OverlayDismissedWidget(),
              ltrOverlayDismissed:
                  Text(deleted, style: TextStyle(color: whiteColor)),
              rtlOverlay: const OverlayDismissedWidget(),
              rtlOverlayDismissed:
                  Text(deleted, style: TextStyle(color: whiteColor)),
              child: HomeNewsListItemBuilderWidget(
                image: context.read<NewsController>().favoriteList[index].image,
                profileImage: context
                    .read<NewsController>()
                    .favoriteList[index]
                    .profileImage,
                type: context.read<NewsController>().favoriteList[index].type,
                title: context.read<NewsController>().favoriteList[index].title,
                name: context.read<NewsController>().favoriteList[index].name,
                date: context.read<NewsController>().favoriteList[index].date,
                onTap: () {
                  context.read<NewsController>().onNewsItemTap(
                        context: context,
                        itemIndex: context
                            .read<NewsController>()
                            .favoriteList[index]
                            .id,
                      );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemCount: context.read<NewsController>().favoriteList.length,
        );
      }
    }

    // Consumer<NewsController>(builder:
    //     (BuildContext context, NewsController controller, Widget? child) {
    //   // if (controller.isLoading) {
    //   //   controller.getFavoriteList();
    //   // }
    //   return controller.isLoading
    //       ? const Center(child: CircularProgressIndicator())
    //       : controller.favoriteList.isEmpty
    //           ? Center(
    //               child: Text(
    //                 noFavoriteNews,
    //                 style: getBoldTextStyle(color: titleTextColor),
    //               ),
    //             )
    //           : ListView.separated(
    //               itemBuilder: (BuildContext context, int index) {
    //                 return HomeNewsListItemBuilderWidget(
    //                   image: controller.newsItems[index].image,
    //                   profileImage: controller.newsItems[index].profileImage,
    //                   type: controller.newsItems[index].type,
    //                   title: controller.newsItems[index].title,
    //                   name: controller.newsItems[index].name,
    //                   date: controller.newsItems[index].date,
    //                   onTap: () {
    //                     controller.onNewsItemTap(
    //                         context: context,
    //                         item: controller.favoriteList[index]);
    //                   },
    //                 );
    //               },
    //               separatorBuilder: (BuildContext context, int index) =>
    //                   const SizedBox(
    //                 height: 10,
    //               ),
    //               itemCount: controller.favoriteList.length,
    //             );
    // });
  }
}
