import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramadan_chanllage_1/models/news_item_model.dart';

import '../resources/colors_manager.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late NewsItemModel item;

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context)!.settings.arguments as NewsItemModel;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: transparentColor,
              ),
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Blur(
                      blur: 5,
                      child: Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: transparentColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(500),
                          ),
                          // shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Column(
                    children: [],
                  ),
                  background: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
