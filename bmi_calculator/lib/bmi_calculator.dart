import 'dart:math';

class BMICalculator {

  BMICalculator({this.height, this.weight, this.bmi});

  final int height;
  final int weight;
  double bmi;

  String calculateBMI() {
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 24) {
      return 'Overweight';
    } else if (bmi > 18.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpolation() {
    if (bmi >= 24) {
      return 'You have a higher than normal body weight. Do some excercise';
    } else if (bmi > 18.5){
      return 'You have a normal body';
    } else {
      return 'Eat more !!';
    }
  }
}