import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/news_item_model.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/strings_manager.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

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

  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  onSliderIndexChange(int index) {
    currentIndex = index;
  }

  onBookmarkPress(item) {
    log(item.id.toString());
    log(item.favorite.toString());
    item.favorite = !item.favorite;
    newsItems[item.id].favorite = !newsItems[item.id].favorite;
  }

  onMorePress() {}

  onNewsItemTap({required BuildContext context, required NewsItemModel item}) {
    Navigator.pushNamed(context, RoutesManager.newsDetailsScreen,
        arguments: item);
  }

  getFavoriteList() {
    for (var element in newsItems) {
      if (element.favorite) {
        favoriteList.add(element);
      }
    }
    isLoading = false;
  }
}
