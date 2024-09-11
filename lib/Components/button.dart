import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.child,
      required this.backgroundColor});

  final double screenHeight;
  final double screenWidth;
  final Widget child;
  final Color backgroundColor;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
