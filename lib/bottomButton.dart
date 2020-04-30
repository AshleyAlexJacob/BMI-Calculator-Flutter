import 'package:flutter/material.dart';
import 'constants.dart';
import 'results_page.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  // ignore: non_constant_identifier_names
  final String ButtonTitle;
  BottomButton({@required this.onTap, @required this.ButtonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(child: Text(ButtonTitle, style: kLargeBottomTextStyle,)),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
      ),
    );
  }
}
