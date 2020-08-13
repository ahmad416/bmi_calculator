import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/card_content.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColour = inActiveCardColor;
  Color femaleColour = inActiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(
          child: Row( children: <Widget>[
            Expanded(
              child: NewReuseableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? activeCardColor: inActiveCardColor,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
              ),
            ),
            Expanded(
              child: NewReuseableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? activeCardColor: inActiveCardColor,
                cardChild: CardContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              ),
            )
          ],),
        ),
        Expanded(
          child: NewReuseableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: labelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                    Text(height.toString(), style: numberTextStyle),
                    Text('cm', style: labelTextStyle,)
                  ],),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
          ),
        ),
        Expanded(
          child: Row( children: <Widget>[
            Expanded(
              child: NewReuseableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: labelTextStyle,),
                      Text(weight.toString(), style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          )
                        ],
                      )
//                      FloatingActionButton(
//                        backgroundColor: Color(0xFF4C4F5E),
//                        child: Icon(Icons.add, color: Colors.white,),
//                      )
                    ],
                  ),
              )
            ),
            Expanded(
              child: NewReuseableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: labelTextStyle,),
                      Text(age.toString(), style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age = age - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age = age + 1;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
              ),
            )
          ],),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
          },
          child: Container(
            child: Center(child: Text('CALCULATE', style: largeButtonTextStyle,)),
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        )
      ],)
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E) ,
    );
  }
}





