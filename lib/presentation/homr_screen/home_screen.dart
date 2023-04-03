import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/presentation/resources/routes_manager.dart';
import 'package:ramadan_chanllage_1/presentation/widgets/home_title_widget.dart';
import '../../models/news_item_model.dart';
import '/presentation/resources/assets_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/strings_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../resources/colors_manager.dart';
import '../widgets/home_slider_widget.dart';
import '../widgets/home_news_list_item_builder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  // Items for the news list
  List<NewsItemModel> listItems = [
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesSecondrySchool,
      profileImage: ImageAssets.imagesRosemary,
      type: education,
      title: secondarySchoolPlacesWhenDoParentsFindOut,
      name: rosemary,
      date: feb28_2023,
      body: bodyString,
    ),
  ];

  // Items for the news list
  List<NewsItemModel> sliderItems = [
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesRace,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: alexanderWearsModifiedHelmetInRoadRaces,
      name: mcKidney,
      date: hoursAgo,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesRace,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: alexanderWearsModifiedHelmetInRoadRaces,
      name: mcKidney,
      date: hoursAgo,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesRace,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: alexanderWearsModifiedHelmetInRoadRaces,
      name: mcKidney,
      date: hoursAgo,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesRace,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: alexanderWearsModifiedHelmetInRoadRaces,
      name: mcKidney,
      date: hoursAgo,
      body: bodyString,
    ),
    NewsItemModel(
      source: cnnIndonesia,
      image: ImageAssets.imagesRace,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: alexanderWearsModifiedHelmetInRoadRaces,
      name: mcKidney,
      date: hoursAgo,
      body: bodyString,
    ),
  ];

  onIndexChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  onNewsItemTap(NewsItemModel item) {
    Navigator.pushNamed(context, RoutesManager.newsDetailsScreen,
        arguments: item);
  }

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
            carouselController: carouselController,
            onIndexChanged: (index) {
              onIndexChange(index);
            },
            items: sliderItems,
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
          HomeTitleWidget(viewAllPressed: () {}, text: recommendation),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // List of News
          DefaultPaddingWidget(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return HomeNewsListItemBuilderWidget(
                  image: listItems[index].image,
                  profileImage: listItems[index].profileImage,
                  type: listItems[index].type,
                  title: listItems[index].title,
                  name: listItems[index].name,
                  date: listItems[index].date,
                  onTap: () {
                    onNewsItemTap(listItems[index]);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              itemCount: listItems.length,
            ),
          )
        ],
      ),
    );
  }
}
