import 'package:flutter/material.dart';
import 'package:bmi_calculator/contants.dart';


class BottomButton extends StatelessWidget {

  final String text;
  final Function onPress;

  BottomButton({this.text,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButtonText,
          ),
        ),
        // padding: EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
