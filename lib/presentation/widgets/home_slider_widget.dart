import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/models/news_item_model.dart';

import '../resources/colors_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
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
  final List<NewsItemModel> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesManager.newsDetailsScreen,
                arguments: items[index]);
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
                  image: AssetImage(
                    items[index].image,
                  ),
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
                        items[index].type,
                        style: getMediumTextStyle(
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          items[index].source,
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
                          items[index].date,
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
                      items[index].title,
                      style: getSemiBoldTextStyle(
                        color: whiteColor,
                      ),
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
