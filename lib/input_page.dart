import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'contants.dart';
import 'bottomButton.dart';
import 'calcultorBrain.dart';



enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Expanded(
            child:Row(
              children:[
                Expanded(
                  child: ReusableCard(
                    color: selectedGender==Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconCentents(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color:   selectedGender==Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconCentents(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ]
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLableTextStyle,
                  ),
                  Row(
                    // textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,

                        onChanged: (val){
                          setState(() {
                            height = val.round();
                          });
                        }
                    ),
                  )
                ],
              ),

            ),
          ),
          Expanded(
            child:Row(
              children:[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
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
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              ] )
          ),
          BottomButton(
            text: 'CALCULATE',
            onPress: (){
              CalculatorBrain clac = CalculatorBrain(height: height,weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=> ResultsPage(
                      bmiResult: clac.calculateBMI(),
                      resultText: clac.getResults(),
                      coments: clac.getComent(),
                    )
                )
              );
            },
          )
        ]
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPress;
  RoundIconButton({@required this.icon,@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      // elevation: 6.0,
      constraints:  BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


