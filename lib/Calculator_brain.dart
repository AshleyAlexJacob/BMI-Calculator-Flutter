import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
   return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi>=25)
      return 'OverWeight';
    else if (_bmi>=18.5)
      return 'Normal';
    else
      return 'UnderWeight';
  }
  String interpretations(){
    if (_bmi>=25)
      return 'You have a higher than normal body weight.\nTry to exercise daily.';
    else if (_bmi>=18.5)
      return 'You have a normal body weight.\nGood Job.';
    else
      return 'You have a lower body weight.\nYou can eat a bit more.';
  }

}