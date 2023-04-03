import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import 'default_padding_widget.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget(
      {super.key, required this.viewAllPressed, required this.text});
  final Function viewAllPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DefaultPaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: getBoldTextStyle(
              color: titleTextColor,
            ),
          ),
          TextButton(
            onPressed: () {
              viewAllPressed();
            },
            child: Text(
              viewAll,
              style: getMediumTextStyle(
                color: textButtonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
