import 'package:flutter/material.dart';
import 'package:hover_effect/hover_effect.dart';

class CircleHome extends StatelessWidget {
  final double heigth;
  final double width;
  final String title;
  final Widget icon;
  final Function function;
  const CircleHome({
    Key key,
    this.heigth,
    this.width,
    this.title,
    this.icon,
    this.function,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: heigth,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF01386D),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white70, width: 2),
          // boxShadow: [
          //   BoxShadow(color: Colors.white70, blurRadius: 20.0),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
