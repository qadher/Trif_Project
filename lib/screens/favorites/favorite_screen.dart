import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/hive/controller/db_controller.dart';
import 'package:trip_calicut/hive/database/model/db_model.dart';
import 'package:trip_calicut/widgets.dart';

class Favorites extends StatelessWidget {
  final DBController favcontroller = Get.put(DBController());
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: AnimationLimiter(child: GetBuilder<DBController>(builder: (cont) {
        return GridView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(_w / 60),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount),
          // crossAxisCount: columnCount,
          itemCount: cont.observableBox.length,
          itemBuilder: (BuildContext context, int index) {
            //  List<TrifsDB> data = favcontroller.observableBox.values.toList();
            List<dynamic> data = cont.observableBox.values.toList();

            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: Duration(milliseconds: 500),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: _w / 30, left: _w / 60, right: _w / 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print('======================');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 14.h,
                              width: double.maxFinite,
                              child: GestureDetector(
                                onTap: () {
                                  print('======================');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: data[index].image == ''
                                      ? Image.asset(
                                          'assets/images/imageone.jpg',
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          Api.imageUrl +
                                              data[index].image.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              data[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            SizedBox(
                              height: 0.1.h,
                            ),
                            Text(
                              data[index].desc,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 13,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      })),

      // body:   AnimationLimiter(
      //   child:GridView.builder(
      //         physics:
      //             BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      //         padding: EdgeInsets.all(_w / 60),
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: columnCount),
      //         // crossAxisCount: columnCount,
      //         itemCount:5,
      //         itemBuilder: (BuildContext context, int index) {
      //           //  List<dynamic> data = cont.observableBox.values.toList();

      //           return AnimationConfiguration.staggeredGrid(
      //             position: index,
      //             duration: Duration(milliseconds: 500),
      //             columnCount: columnCount,
      //             child: ScaleAnimation(
      //               duration: Duration(milliseconds: 900),
      //               curve: Curves.fastLinearToSlowEaseIn,
      //               child: FadeInAnimation(
      //                 child: Container(
      //                   margin: EdgeInsets.only(
      //                       bottom: _w / 30, left: _w / 60, right: _w / 60),
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.all(Radius.circular(20)),
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: Colors.black.withOpacity(0.1),
      //                         blurRadius: 40,
      //                         spreadRadius: 10,
      //                       ),
      //                     ],
      //                   ),
      //                   child: Padding(
      //                     padding: const EdgeInsets.all(4.0),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         SizedBox(
      //                           height: 14.h,
      //                           width: double.maxFinite,
      //                           child: ClipRRect(
      //                             borderRadius: BorderRadius.only(
      //                                 topLeft: Radius.circular(20),
      //                                 topRight: Radius.circular(20)),
      //                             child: Image.asset(
      //                               'assets/images/imageone.jpg',
      //                               fit: BoxFit.cover,
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 0.5.h,
      //                         ),
      //                         Text(
      //                           'NAme',
      //                           overflow: TextOverflow.ellipsis,
      //                           maxLines: 1,
      //                           style: TextStyle(
      //                               fontSize: 20,
      //                               fontWeight: FontWeight.bold,
      //                               fontFamily: 'Lato',
      //                               color: Colors.black.withOpacity(0.5)),
      //                         ),
      //                         SizedBox(
      //                           height: 0.1.h,
      //                         ),
      //                         Text(
      //                           'sdajsahdzgcjgdsafjhgj chdcvhack bbdvchdasvabdsjhg  hgvhsx chvhgvc h hdjhjg xhvdsyzfuvj ghvgyV',
      //                           maxLines: 2,
      //                           style: TextStyle(
      //                               fontSize: 13,
      //                               // fontWeight: FontWeight.bold,
      //                               color: Colors.black.withOpacity(0.5)),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ))
    );
  }
}
