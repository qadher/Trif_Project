import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';

import '../../../controllers/promotedpackagesapicontroller.dart';




   final List<String> promotedImageHomepage = [
    //  '${promotedPackageController.promotedPackageData.value[0].image}',
    //  '${promotedPackageController.promotedPackageData.value[1].image}',
    //  '${promotedPackageController.promotedPackageData.value[2].image}',
    'assets/images/add_banner.jpg',
  'assets/images/add_banner.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  'assets/images/background.jpg',
  'assets/images/imageone.jpg',
  
];


final List<Widget> promotedBannerHomepage = promotedImageHomepage
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(Api.imageUrl + item, fit: BoxFit.cover, width: 1000.0),
                       Positioned(
            top: 0,
            child: Container(
              // width: 60.w,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(5.0)), 
              ),
              
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                child: Text('Promoted',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    )),
              ),
            ))
                    ],
                  )),
            ),
          ))
      .toList();