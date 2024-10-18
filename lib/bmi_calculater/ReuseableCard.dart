import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(
      {required this.colour,
      required this.childCard,
      this.onPressed}); // requiredを追加

  final Color colour;
  final Widget childCard;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null ? () => onPressed!() : null,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: childCard,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
