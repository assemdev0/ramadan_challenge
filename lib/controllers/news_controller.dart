import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/models/top_headlines_model/top_headlines_success_model.dart';
import '../models/top_headlines_model/top_headlines_error_model.dart';
import '../models/top_headlines_model/top_headlines_model.dart';
import '../presentation/resources/routes_manager.dart';
import '../repository/repo.dart';

class NewsController with ChangeNotifier {
  TopHeadlinesSuccessModel? newsSuccessModel;
  TopHeadlinesErrorModel? newsErrorModel;
  bool isLoading = true;
  late Articles itemNewsItem;
  int onProgrees = 0;

  onProgreesChange(int progress) {
    onProgrees = progress;
    notifyListeners();
  }

  CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  onSliderIndexChange(int index) {
    currentIndex = index;
    notifyListeners();
  }

  changeFavoriteState(int index) {
    log(newsSuccessModel!.articles![index].favorite.toString());
    newsSuccessModel!.articles![index].favorite =
        !newsSuccessModel!.articles![index].favorite!;
    notifyListeners();
  }

  List<Articles> favoriteList = [];
  onBackPress(BuildContext context) {
    Navigator.pop(context);
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

  onNewsItemTap({
    required BuildContext context,
    required Articles item,
  }) {
    Navigator.pushNamed(context, RoutesManager.newsDetailsScreen,
        arguments: item);
  }

  getNewsList() async {
    if (newsSuccessModel == null) {
      Articles.count = 0;
      TopHeadlinesModel newsModel =
          await Repository.instance.featchCategoryNews();
      if (newsModel is TopHeadlinesSuccessModel) {
        newsSuccessModel = newsModel;
        log(newsSuccessModel!.articles!.first.id.toString());
        log(newsSuccessModel!.articles!.last.id.toString());
      } else if (newsModel is TopHeadlinesErrorModel) {
        newsErrorModel = newsModel;
      }
      isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Articles>> getFavoriteList() async {
    favoriteList.clear();
    for (var element in newsSuccessModel!.articles!) {
      if (element.favorite!) {
        favoriteList.add(element);
      }
    }
    isLoading = false;
    return favoriteList;
  }
}
