import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../screens/results_page.dart';

//widgets import
import '../widgets/reusable_card.dart';
import '../widgets/card_container.dart';
import '../widgets/round_button.dart';
import '../widgets/bottom_button.dart';

// import calculateBrain
import '../calculator_brain.dart';

enum Gender{male,female}



class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor= kInactiveColor;
  Color femaleCardColor= kInactiveColor;
  Gender? selectGender;
  int height=180;
  int weight=60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children:  <Widget>[
                  Expanded(
                      child: ReusableCard(
                    color: selectGender==Gender.male?kActiveColor: kInactiveColor,onPress: () {setState(() {
                      selectGender= Gender.male;
                    });} ,cardChild: const CardContainer(icon: FontAwesomeIcons.mars, text:'MALE'),
                  )),
                  Expanded(
                    child:ReusableCard(
                      color: selectGender==Gender.female?kActiveColor: kInactiveColor,onPress: () {setState(() {
                        selectGender=Gender.female;
                      });} ,cardChild: const CardContainer(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  )
                ],
              ),
            ),
             Expanded(child: ReusableCard(color: const Color(0xFF1D1E33), cardChild:Column(
               mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                const Text("HEIGHT", style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  <Widget>[

                    Text(height.toString(),style: kLargeNumber,),
                    const  Text('cm',style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0 ),
                      activeTrackColor: Colors.white,
                      thumbColor:const Color(0xFFFB1555 ),
                      overlayColor: const Color(0x29EB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98)

                  ),
                  child: Slider(value: height.toDouble(),min:120.0 ,max:220.0, onChanged:(double newHeight){
                    setState(() {
                      height=newHeight.round();
                    });
                  }),
                )
              ],
            ),)),
            Expanded(
              child: Row(
                children:  <Widget>[
                  Expanded(child: ReusableCard(color:const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT',style: kLabelTextStyle,),
                        Text(weight.toString(),style: kLargeNumber,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight-=1;
                                });
                              },),
                            const SizedBox(width: 20.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed:(){
                              setState(() {
                                weight+=1;
                              });
                            },),


                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(

                    child: ReusableCard(
                      color:const Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('AGE',style: kLabelTextStyle,),
                          Text(age.toString(),style: kLargeNumber,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age-=1;
                                  });
                                },),
                              const SizedBox(width: 20.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,onPressed:(){
                                setState(() {
                                  age+=1;
                                });
                              },),


                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(buttonTitle: 'CALCULATE',onTap:  (){
              CalculatorBrain cal= CalculatorBrain(height: height, weight: weight);
              cal.calculateBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  ResultsPage(resultText: cal.getResult(),interpretation: cal.getInterpretation(),bmiResult: cal.calculateBMI(),);
              }));
            },)
          ],
        ),
      ),
    );
  }
}








