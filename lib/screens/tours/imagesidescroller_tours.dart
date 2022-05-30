import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets.dart';

Container insideScrollerTours(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    
                    image: AssetImage('assets/images/honeymoon_banner.jpeg',),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trekking',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  heightSizedBox(),
                                  Text(
                                    'Explore the world of adventure',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //add button

                            GestureDetector(
                              onTap: () {
                                final snackBar = SnackBar(
                                  content: const Text('Hi, I am a SnackBar!'),
                                  backgroundColor: (Colors.black),
                                  action: SnackBarAction(
                                    label: 'dismiss',
                                    textColor: Colors.amber,
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Container(
                                // height: 10.h,
                                padding: EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 30.h,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

  Column scrollCard() {
    return Column(
      children: [
        Stack(children: [
          Container(
            height: 12.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.8, color: Colors.white),
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 30.w,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Text(
                      'Malampuzha',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ))
        ]),
        SizedBox(
          height: 10,
        ),
        Stack(children: [
          Container(
            height: 12.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.8, color: Colors.white),
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 30.w,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Text(
                      'Malampuzha',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ))
        ]),
      ],
    );
  }