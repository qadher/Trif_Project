import 'package:flutter/material.dart';

import '../screens/home/components/titletext.dart';

class ViewAll extends StatelessWidget {
  final String text;
  const ViewAll({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleText(text: text),
        Text(
          'view all',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}
