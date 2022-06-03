import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../constant/api.dart';

class FullScreenImage extends StatelessWidget {
   FullScreenImage({Key? key}) : super(key: key);
   String imageUrl = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //image full screen 
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
           Api.imageUrl +  '$imageUrl',
            fit: BoxFit.fitWidth,
          ),
        
      ),
      ),
    );
  }
}