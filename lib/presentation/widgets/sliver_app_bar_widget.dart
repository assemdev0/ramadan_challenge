import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramadan_chanllage_1/presentation/resources/assets_manager.dart';
import '/models/top_headlines_model/top_headlines_success_model.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import 'blured_icon_widget.dart';
import 'dot_wudget.dart';
import 'verified_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {super.key,
      required this.item,
      required this.onBackPress,
      required this.onBookmarkPress,
      required this.onMorePress});

  final Articles item;
  final Function onBackPress;
  final Function onBookmarkPress;
  final Function onMorePress;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primarySwatchColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: transparentColor,
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.6,
      floating: true,
      pinned: true,
      leading: BluredIconWidget(
        icon: Icons.arrow_back_ios_outlined,
        onPressed: () {
          onBackPress();
        },
      ),
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      actions: [
        BluredIconWidget(
          icon: item.favorite ?? false
              ? CupertinoIcons.bookmark_solid
              : CupertinoIcons.bookmark,
          onPressed: () {
            onBookmarkPress();
          },
        ),
        const SizedBox(
          width: 10,
        ),
        BluredIconWidget(
          icon: Icons.more_horiz,
          onPressed: () {
            onMorePress();
          },
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            Positioned.fill(
              child: item.urlToImage == null
                  ? Image.asset(
                      ImageAssets.noImage,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                    )
                  : Image.network(
                      item.urlToImage!,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                    ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.12,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.046,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      item.author ?? 'Unknown',
                      style: getMediumTextStyle(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.title!,
                    style:
                        getSemiBoldTextStyle(color: whiteColor, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        trinding,
                        style: getRegularTextStyle(
                            color: whiteColor, fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      const DotWidget(),
                      const SizedBox(width: 10),
                      Text(
                        item.publishedAt!,
                        style: getRegularTextStyle(
                            color: whiteColor, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(ImageAssets.imageCNN),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.source!.name!,
                      style: getBoldTextStyle(color: titleTextColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const VerifiedWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
