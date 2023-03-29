import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget(
      {Key? key,
      required this.carouselController,
      required this.onIndexChanged,
      required this.image})
      : super(key: key);
  final CarouselController carouselController;
  final Function(int) onIndexChanged;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                isAntiAlias: true,
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.046,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      sports,
                      style: getMediumTextStyle(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        cnnIndonesia,
                        style: getMediumTextStyle(
                          color: whiteColor,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.025,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.check,
                          color: whiteColor,
                          size: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                        width: MediaQuery.of(context).size.width * 0.01,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        hoursAgo,
                        style: getMediumTextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    alexanderWearsModifiedHelmetInRoadRaces,
                    style: getSemiBoldTextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          onIndexChanged(index);
        },
        height: MediaQuery.of(context).size.height * 0.3,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        scrollPhysics: const BouncingScrollPhysics(),
        animateToClosest: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
