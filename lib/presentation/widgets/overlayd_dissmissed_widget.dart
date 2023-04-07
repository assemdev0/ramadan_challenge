import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';

class OverlayDismissedWidget extends StatelessWidget {
  const OverlayDismissedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: errorRedColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            delete,
            style: TextStyle(color: whiteColor),
          ),
          const SizedBox(height: 5),
          Icon(
            Icons.delete,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
