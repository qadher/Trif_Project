import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 138, 138, 138),
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
      ),
    );
  }
}
