import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  const ButtonComponent(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
    required this. ButtonHeight,
      required this.child,
       required this.radius,
      required this.backgroundColor});

  final double screenHeight;
  
  final double radius;
  final double ButtonHeight;
  final double screenWidth;
  final Widget child;
  final Color backgroundColor;

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenHeight * widget.ButtonHeight,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.screenWidth * widget.radius)
      ),
      child: widget.child,
    );
  }
}
