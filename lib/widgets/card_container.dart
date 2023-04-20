import 'package:flutter/material.dart';
import '../constants.dart';


class CardContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardContainer({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80.0,), // pass the `icon` parameter to the Icon widget
        const SizedBox(height: 15.0,),
        Text(
          text,
          style:kLabelTextStyle,
        ),
      ],
    );
  }
}