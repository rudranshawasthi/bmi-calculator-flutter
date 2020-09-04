

import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow( (height/100) , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi>25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getComent(){
    if (_bmi>25){
      return 'Start going to GYM and lose weight';
    }
    else if(_bmi>18.5){
      return 'Man you are Fit';
    }
    else{
      return 'Start Eating Please';
    }
  }

}