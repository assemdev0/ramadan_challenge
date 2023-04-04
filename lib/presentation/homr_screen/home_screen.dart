import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/news_cubit/news_cubit.dart';
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
    var cubit = BlocProvider.of<NewsCubit>(context);
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
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
                  carouselController: cubit.carouselController,
                  onIndexChanged: (index) {
                    cubit.onSliderIndexChange(index);
                  },
                  items: cubit.newsItems,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                AnimatedSmoothIndicator(
                  activeIndex: cubit.currentIndex,
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
                        image: cubit.newsItems[index].image,
                        profileImage: cubit.newsItems[index].profileImage,
                        type: cubit.newsItems[index].type,
                        title: cubit.newsItems[index].title,
                        name: cubit.newsItems[index].name,
                        date: cubit.newsItems[index].date,
                        onTap: () {
                          cubit.onNewsItemTap(
                              context: context, item: cubit.newsItems[index]);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                    itemCount: cubit.newsItems.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
