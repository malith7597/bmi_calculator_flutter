import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,required this.buttonTitle, required this.onTap
  });

  final Function() onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
          width: double.infinity,
          height: kContainBottomHeight,
          color: const Color(0xFFDF005A),
          margin: const  EdgeInsets.only(top: 10),
          padding:const EdgeInsets.only(bottom: 20),
          child:Center(child: Text(buttonTitle!,style:const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),))),
    );
  }
}