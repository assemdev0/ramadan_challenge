import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/resources/styles_manager.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '/resources/strings_manager.dart';
import '/resources/colors_manager.dart';
import 'home_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentBNAVIndex = 0;
  List<SalomonBottomBarItem> items = [
    SalomonBottomBarItem(
      title: Text(home, style: getMediumTextStyle(color: whiteColor)),
      icon: Icon(
        CupertinoIcons.house_fill,
        color: disabledIconColor,
      ),
      activeIcon: Icon(
        CupertinoIcons.house_fill,
        color: whiteColor,
      ),
    ),
    SalomonBottomBarItem(
      title: Text(network, style: getMediumTextStyle(color: whiteColor)),
      icon: Icon(
        Icons.language,
        color: disabledIconColor,
      ),
      activeIcon: Icon(
        Icons.language,
        color: whiteColor,
      ),
    ),
    SalomonBottomBarItem(
      title: Text(save, style: getMediumTextStyle(color: whiteColor)),
      icon: Icon(
        CupertinoIcons.bookmark,
        color: disabledIconColor,
      ),
      activeIcon: Icon(
        CupertinoIcons.bookmark,
        color: whiteColor,
      ),
    ),
    SalomonBottomBarItem(
      title: Text(profile, style: getMediumTextStyle(color: whiteColor)),
      icon: Icon(
        CupertinoIcons.person,
        color: disabledIconColor,
      ),
      activeIcon: Icon(
        CupertinoIcons.person,
        color: whiteColor,
      ),
    ),
  ];
  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: disabledColor,
          radius: MediaQuery.of(context).size.width * 0.05,
          child: Icon(Icons.menu, color: titleTextColor),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: disabledColor,
            child: Icon(CupertinoIcons.search, color: titleTextColor),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          CircleAvatar(
            backgroundColor: disabledColor,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Icon(CupertinoIcons.bell, color: titleTextColor),
                Container(
                  width: MediaQuery.of(context).size.width * 0.022,
                  height: MediaQuery.of(context).size.width * 0.022,
                  margin: EdgeInsetsDirectional.only(
                    top: MediaQuery.of(context).size.height * 0.004,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        ],
        leadingWidth: MediaQuery.of(context).size.width * 0.25,
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: items,
        selectedItemColor: primaryColor,
        unselectedItemColor: disabledColor,
        selectedColorOpacity: 1,
        currentIndex: currentBNAVIndex,
        onTap: (index) {
          setState(() {
            currentBNAVIndex = index;
          });
        },
      ),
      body: screens[currentBNAVIndex],
    );
  }
}
