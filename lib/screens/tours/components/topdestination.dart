import 'package:flutter/material.dart';

class TopDestination extends StatelessWidget {
  const TopDestination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Otty',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //border color
          side: BorderSide(color: Colors.grey, width: 0.4),
        ),
      ),
    );
  }
}
