import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
      width: MediaQuery.of(context).size.width * 0.01,
      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
