import 'package:bmicalculator/bottomButton.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.ResultText,@required this.Interpretation});

  final String bmiResult;
  final String ResultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0), textAlign: TextAlign.center,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results', style: kTitleText,))),
          Expanded(flex: 5,child: reusedCard(color: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(ResultText.toUpperCase(),style: kResultTextStyle,),
              Text(bmiResult,style: kBMITextStyle,),
              Text(Interpretation,style: kResultBodyTextStyle,textAlign: TextAlign.center,),
              Text('UI Design Credits :  Ruben Vaalt | Dribbble',style: kDesignCreditsTextStyle,textAlign: TextAlign.center,),
            ],
          ),
          ),),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, ButtonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
