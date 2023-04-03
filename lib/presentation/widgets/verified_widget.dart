import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.025,
      backgroundColor: primaryColor,
      child: Icon(
        Icons.check,
        color: whiteColor,
        size: MediaQuery.of(context).size.width * 0.03,
      ),
    );
  }
}
