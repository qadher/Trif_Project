import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/controllers/promotedpackagesapicontroller.dart';

 


final List<String> images = [
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
];
 final List<String> imgList = [
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



   final List<String> imgListInner = [
     
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


final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          // child: Text(
                          //   'No. ${imgList.indexOf(item)} image',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20.0,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

      final List<Widget> imageSlidersBanner = imgListInner
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
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