import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottomButton.dart';
import 'roundIconButton.dart';
import 'Calculator_brain.dart';
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Comments
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//  void updateCardColor(Gender selectedGender) {
////    if (selectedGender == Gender.male) if (maleCardColor == inactiveCardColor)
//      {maleCardColor = activeCardColor;
//      femaleCardColor = inactiveCardColor;}
//    else
//      maleCardColor = inactiveCardColor;
//    else if (selectedGender== Gender.female) if (femaleCardColor == inactiveCardColor)
//     { femaleCardColor = activeCardColor;
//      maleCardColor = inactiveCardColor;}
//    else
//      femaleCardColor = inactiveCardColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        title: Center(child: Text('BMI CALCULATOR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusedCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: iconContent(
                        myicon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: reusedCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: iconContent(
                        myicon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new reusedCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNewLabelTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 25.0,
                            ),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
//
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                              print(newValue);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new reusedCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNewLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                         ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new reusedCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLabelTextStyle,),
                        Text(age.toString(), style: kNewLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              ResultText: calc.getResult(),
              Interpretation: calc.interpretations(),
            ),),);
          },
          ButtonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

