import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {

  iconContent({this.myicon,this.label});

  final IconData myicon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(myicon,
          size: 80.0,),
        SizedBox(height: 15.0,),
        Text(label,style: kLabelTextStyle),
      ],
    );
  }
}
