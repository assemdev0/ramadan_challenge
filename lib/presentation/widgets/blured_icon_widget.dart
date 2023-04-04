import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';

class BluredIconWidget extends StatelessWidget {
  const BluredIconWidget(
      {super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Blur(
            blur: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.width * 0.12,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: transparentColor,
                shape: BoxShape.circle,
                // shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            icon,
            color: whiteColor,
            size: MediaQuery.of(context).size.width * 0.065,
          ),
        ),
      ],
    );
  }
}
