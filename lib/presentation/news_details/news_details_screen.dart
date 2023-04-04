import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_chanllage_1/models/news_item_model.dart';

import '../../cubit/news_cubit/news_cubit.dart';
import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';
import '../widgets/default_padding_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsItemModel item =
        ModalRoute.of(context)!.settings.arguments as NewsItemModel;
    var cubit = BlocProvider.of<NewsCubit>(context);
    return BlocBuilder<NewsCubit, NewsState>(
      bloc: NewsCubit(),
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBarWidget(
                  item: item,
                  onBackPress: () {
                    cubit.onBackPress(context);
                  },
                  onBookmarkPress: () {
                    cubit.onBookmarkPress(item);
                  },
                  onMorePress: () {},
                ),
              ];
            },
            body: DefaultPaddingWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      item.body,
                      style: getMediumTextStyle(
                        color: titleTextColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
