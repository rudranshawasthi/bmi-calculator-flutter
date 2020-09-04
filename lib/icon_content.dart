import 'package:flutter/material.dart';
import 'contants.dart';

class IconCentents extends StatelessWidget {

  final String text;
  final IconData icon;

  IconCentents({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15,),
        Text(
          text,
          style: kLableTextStyle,
        )
      ],
    );
  }
}