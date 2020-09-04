import 'package:bmi_calculator/contants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bottomButton.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.coments});

  final String bmiResult;
  final String resultText;
  final String coments;


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULTS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text('Your Result',
              style: kResultTitle,
              ),
            )
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kRangeStyle,
                    ),
                    Text(
                      bmiResult.toUpperCase(),
                      style: kBMI,
                    ),
                    Text(
                      coments.toUpperCase(),
                      style: kComent,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPress: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
