import 'package:flutter/material.dart';


class reusedCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function onPress;

  reusedCard({
    @required this.color,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 220.0,
        width: 170.0,
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
