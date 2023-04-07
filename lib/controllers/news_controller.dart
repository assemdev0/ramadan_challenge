import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/news_item_model.dart';
import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/strings_manager.dart';

class NewsController with ChangeNotifier {
  List<NewsItemModel> newsItems = [
    NewsItemModel(
      id: 0,
      sourceImage: ImageAssets.imageCNN,
      source: cnnIndonesia,
      image: ImageAssets.imagesVolleyball,
      profileImage: ImageAssets.imagesMcKidney,
      type: sports,
      title: whatTrainingDoVolleyballPlayersNeed,
      name: mcKidney,
      date: feb27_20_23,
      body: bodyString,
      favorite: false,
    ),
    NewsItemModel(
      id: 1,
      favorite: false,
      sourceImage: ImageAssets.imageCNN,
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
      id: 2,
      favorite: false,
      sourceImage: ImageAssets.imageCNN,
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
      id: 3,
      favorite: false,
      sourceImage: ImageAssets.imageCNN,
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
      id: 4,
      favorite: false,
      sourceImage: ImageAssets.imageCNN,
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
      id: 5,
      favorite: false,
      sourceImage: ImageAssets.imageCNN,
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

  List<NewsItemModel> favoriteList = [];
  onBackPress(BuildContext context) {
    Navigator.pop(context);
  }

  bool isLoading = true;
  // late NewsItemModel item;
  late int itemNewsItemIndex;

  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  onSliderIndexChange(int index) {
    currentIndex = index;
    notifyListeners();
  }

  changeFavoriteState(int index) {
    log(newsItems[index].favorite.toString());
    newsItems[index].favorite = !newsItems[index].favorite;
    notifyListeners();
  }

  deleteFavoriteItem({
    required int index,
    required int id,
  }) {
    favoriteList.removeAt(index);
    changeFavoriteState(id);
    log(favoriteList.length.toString());
    notifyListeners();
  }

  onMorePress() {}

  onNewsItemTap({required BuildContext context, required int itemIndex}) {
    Navigator.pushNamed(context, RoutesManager.newsDetailsScreen,
        arguments: itemIndex);
  }

  Future<List<NewsItemModel>> getFavoriteList() async {
    favoriteList.clear();
    for (var element in newsItems) {
      if (element.favorite) {
        favoriteList.add(element);
      }
    }
    isLoading = false;
    // notifyListeners();
    return favoriteList;
    // notifyListeners();
  }
}
