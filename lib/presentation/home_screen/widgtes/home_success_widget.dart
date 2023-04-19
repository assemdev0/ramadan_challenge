import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/default_padding_widget.dart';
import '../../widgets/home_news_list_item_builder_widget.dart';
import '../../widgets/home_slider_widget.dart';
import '../../widgets/home_title_widget.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({super.key, required this.controller});
  final NewsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Breaking News Title
          HomeTitleWidget(viewAllPressed: () {}, text: breakingNews),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Slider
          HomeSliderWidget(
            carouselController: controller.carouselController,
            onIndexChanged: (index) {
              controller.onSliderIndexChange(index);
            },
            items: controller.newsSuccessModel!.articles!,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          AnimatedSmoothIndicator(
            activeIndex: controller.currentIndex,
            count: 5,
            effect: ExpandingDotsEffect(
              dotColor: disabledColor,
              activeDotColor: primaryColor,
              dotHeight: MediaQuery.of(context).size.height * 0.015,
              dotWidth: MediaQuery.of(context).size.height * 0.015,
              expansionFactor: 3,
              spacing: MediaQuery.of(context).size.height * 0.01,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // Recommendation Title
          HomeTitleWidget(viewAllPressed: () {}, text: recommendation),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // List of News
          DefaultPaddingWidget(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return HomeNewsListItemBuilderWidget(
                  image:
                      controller.newsSuccessModel!.articles![index].urlToImage,
                  profileImage: ImageAssets.imagesMcKidney,
                  type: controller.newsSuccessModel!.articles![index].author!,
                  title: controller.newsSuccessModel!.articles![index].title!,
                  name: mcKidney,
                  date: controller
                      .newsSuccessModel!.articles![index].publishedAt!,
                  onTap: () {
                    controller.onNewsItemTap(
                      context: context,
                      item: controller.newsSuccessModel!.articles![index],
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              itemCount: controller.newsSuccessModel!.articles!.length,
            ),
          )
        ],
      ),
    );
  }
}
