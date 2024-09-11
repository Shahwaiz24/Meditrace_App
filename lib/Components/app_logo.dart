import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo(
      {super.key,
      required this.screenheight,
      required this.screenwidth,
      required this.imageHeight});
  final double screenheight;
  final double screenwidth;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return Image(
      alignment: Alignment.center,
      image: const AssetImage('assets/images/App_logo.png'),
      height: screenheight * imageHeight,
    );
  }
}
