import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/presentation/resources/assets_manager.dart';
import '/models/top_headlines_model/top_headlines_success_model.dart';

import '../../controllers/news_controller.dart';
import '../resources/colors_manager.dart';

import '../resources/styles_manager.dart';
import 'dot_wudget.dart';
import 'verified_widget.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({
    Key? key,
    required this.carouselController,
    required this.onIndexChanged,
    required this.items,
  }) : super(key: key);
  final CarouselController carouselController;
  final Function(int) onIndexChanged;
  final List<Articles> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            context.read<NewsController>().onNewsItemTap(
                  context: context,
                  item: items[index],
                );
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  isAntiAlias: true,
                  image: items[index].urlToImage == null
                      ? const AssetImage(
                          ImageAssets.noImage,
                        )
                      : NetworkImage(
                          items[index].urlToImage,
                        ) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
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
                        items[index].author!,
                        style: getMediumTextStyle(
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          items[index].source!.name!,
                          style: getMediumTextStyle(
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        const VerifiedWidget(),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        const DotWidget(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          items[index].publishedAt!,
                          style: getMediumTextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      items[index].title!,
                      style: getSemiBoldTextStyle(
                        color: whiteColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          onIndexChanged(index);
        },
        height: MediaQuery.of(context).size.height * 0.3,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        scrollPhysics: const BouncingScrollPhysics(),
        animateToClosest: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
