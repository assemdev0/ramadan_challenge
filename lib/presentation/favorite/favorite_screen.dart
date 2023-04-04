import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_chanllage_1/models/news_item_model.dart';
import 'package:ramadan_chanllage_1/presentation/resources/styles_manager.dart';

import '../../cubit/news_cubit/news_cubit.dart';
import '../resources/colors_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../widgets/home_news_list_item_builder_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewsCubit>(context);
    return BlocBuilder<NewsCubit, NewsState>(
        bloc: NewsCubit(),
        builder: (BuildContext context, NewsState state) {
          return cubit.isLoading
              ? const Center(child: CircularProgressIndicator())
              : cubit.favoriteList.isEmpty
                  ? Center(
                      child: Text(
                        noFavoriteNews,
                        style: getBoldTextStyle(color: titleTextColor),
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return HomeNewsListItemBuilderWidget(
                          image: cubit.newsItems[index].image,
                          profileImage: cubit.newsItems[index].profileImage,
                          type: cubit.newsItems[index].type,
                          title: cubit.newsItems[index].title,
                          name: cubit.newsItems[index].name,
                          date: cubit.newsItems[index].date,
                          onTap: () {
                            cubit.onNewsItemTap(
                                context: context,
                                item: cubit.favoriteList[index]);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                      itemCount: cubit.favoriteList.length,
                    );
        });
  }
}
