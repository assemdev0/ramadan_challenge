import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramadan_chanllage_1/controllers/news_controller.dart';

import '/presentation/widgets/home_title_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/strings_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../resources/colors_manager.dart';
import '../widgets/home_slider_widget.dart';
import '../widgets/home_news_list_item_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsController>(
      builder:
          (BuildContext context, NewsController controller, Widget? child) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
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
                items: controller.newsItems,
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
                      image: controller.newsItems[index].image,
                      profileImage: controller.newsItems[index].profileImage,
                      type: controller.newsItems[index].type,
                      title: controller.newsItems[index].title,
                      name: controller.newsItems[index].name,
                      date: controller.newsItems[index].date,
                      onTap: () {
                        controller.onNewsItemTap(
                            context: context,
                            itemIndex: controller.newsItems[index].id);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                  itemCount: controller.newsItems.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
