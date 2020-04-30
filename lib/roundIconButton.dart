import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {

  // ignore: non_constant_identifier_names
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;


  @override

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4FE),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

    );
  }
}
