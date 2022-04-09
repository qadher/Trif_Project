import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/homescreen.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
   
  AppBarWidget({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () => Get.offAllNamed('/home'),
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomeScreen(),
        //   ),

        // ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.location_on_outlined, color: Colors.blue),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.tune_outlined, color: Colors.blue),
          onPressed: () {},
        ),
      ],
    );
  }
}
