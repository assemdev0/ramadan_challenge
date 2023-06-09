import 'package:flutter/material.dart';
import 'package:ramadan_chanllage_1/presentation/resources/assets_manager.dart';

import '../resources/colors_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class HomeNewsListItemBuilderWidget extends StatelessWidget {
  const HomeNewsListItemBuilderWidget(
      {Key? key,
      required this.image,
      required this.type,
      required this.title,
      required this.profileImage,
      required this.name,
      required this.date,
      required this.onTap})
      : super(key: key);
  final String? image;
  final String type;
  final String title;
  final String profileImage;
  final String name;
  final String date;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: image == null
                    ? const AssetImage(ImageAssets.noImage)
                    : NetworkImage(image!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: getMediumTextStyle(
                    color: disabledTextColor,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  title,
                  style: getBoldTextStyle(
                    color: titleTextColor,
                    fontSize: FontSizeManager.s16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.018,
                      backgroundImage: AssetImage(
                        profileImage,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Text(
                      name,
                      style: getMediumTextStyle(
                        color: disabledTextColor,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.01,
                      height: MediaQuery.of(context).size.width * 0.01,
                      decoration: BoxDecoration(
                        color: disabledTextColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Expanded(
                      child: Text(
                        date,
                        style: getMediumTextStyle(
                          color: disabledTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
