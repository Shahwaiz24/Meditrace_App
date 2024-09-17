import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.ButtonHeight,
      required this.child,
      required this.decoration,
});

  final double screenHeight;

  final BoxDecoration decoration;
  final double ButtonHeight;
  final double screenWidth;
  final Widget child;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenHeight * widget.ButtonHeight,
      decoration:widget.decoration,
      child: widget.child,
    );
  }
}
