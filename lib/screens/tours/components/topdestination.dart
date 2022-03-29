import 'package:flutter/material.dart';

class TopDestination extends StatelessWidget {
   TopDestination({
    Key? key,
  }) : super(key: key);
 
List<String> places = [
  'Otty',
  'Kodailanal'
  'Mysuru',
  'Bengaluru',
  'Delhi'
];
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Mysuru',
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
