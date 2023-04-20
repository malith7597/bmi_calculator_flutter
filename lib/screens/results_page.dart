import 'package:bmi_calculator_flutter/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_card.dart';
import '../constants.dart';


class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  const ResultsPage({ super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  <Widget>[
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text('Your Result',style:TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ) ,),
              )),
          Expanded(
            flex: 4,
              child: ReusableCard(color: kActiveColor,cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:   <Widget>[
               Center(
                child: Text(resultText!.toUpperCase(),style: const TextStyle(
                  color: Color(0xFF24D876),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),),
              ),
                  Center(
                    child: Text(bmiResult!, style:  TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color:double.parse(bmiResult!)>25?Colors.red:Colors.white
                    ),),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 35.0),
                     child: Align(
                       alignment: Alignment.center,
                       child: Text(interpretation!,style: const TextStyle(
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                         textBaseline: TextBaseline.alphabetic

                       ),),
                     ),
                   ),


            ],
          ),)),
          BottomButton(buttonTitle: "RE-CALCULATE", onTap: (){
            Navigator.pop(context);

          })

        ],
      ),
    );
  }
}
