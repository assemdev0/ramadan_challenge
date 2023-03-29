import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/resources/assets_manager.dart';
import 'package:ramadan_chanllage_1/resources/font_manager.dart';
import 'package:ramadan_chanllage_1/resources/styles_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/resources/strings_manager.dart';
import '/widgets/default_padding_widget.dart';
import '/resources/colors_manager.dart';
import 'widgets/home_slider_widget.dart';
import 'widgets/news_list_item_builder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  // Items for the news list
  List<ItemModel> items = [
    ItemModel(
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
    ),
    ItemModel(
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
    ),
    ItemModel(
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
    ),
    ItemModel(
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
    ),
    ItemModel(
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
    ),
    ItemModel(
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Breaking News Title
          DefaultPaddingWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  breakingNews,
                  style: getBoldTextStyle(
                    color: titleTextColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    viewAll,
                    style: getMediumTextStyle(
                      color: textButtonColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Slider
          HomeSliderWidget(
            carouselController: carouselController,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            image: ImageAssets.imagesRace,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
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
          DefaultPaddingWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recommendation,
                  style: getBoldTextStyle(
                    color: titleTextColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    viewAll,
                    style: getMediumTextStyle(
                      color: textButtonColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // List of News
          DefaultPaddingWidget(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return NewsListItemBuilderWidget(
                  image: items[index].image,
                  profileImage: items[index].profileImage,
                  type: items[index].type,
                  title: items[index].title,
                  name: items[index].name,
                  date: items[index].date,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  final String image;
  final String profileImage;
  final String type;
  final String title;
  final String name;
  final String date;

  ItemModel({
    required this.image,
    required this.type,
    required this.title,
    required this.name,
    required this.date,
    required this.profileImage,
  });
}
