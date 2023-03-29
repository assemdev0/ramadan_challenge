import 'package:flutter/material.dart';

class DefaultPaddingWidget extends StatelessWidget {
  const DefaultPaddingWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: child,
    );
  }
}
