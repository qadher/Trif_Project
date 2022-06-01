import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/offer_page/offersapicontroller.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidgetwithoutArrow.dart';
import '../../widgets.dart';
import '../tours/components/AppBarWidget.dart';
import '../tours/components/categoryscrolllist.dart';
import 'featuredofferapicontroller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OfferScreen extends StatelessWidget {
  final OffersApiController offersApiController =
      Get.put(OffersApiController());
  final FeaturedofferApiController featuredOffersController =
      Get.put(FeaturedofferApiController());

  OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(56),
      //   child: AppBarWidget(
      //     title: 'Offers',
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidgetWithoutBack(
          title: 'Offers',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          // child: SingleChildScrollView(
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
                // adsBanner(context),

              //   heightSizedBox(),
              // // ElevatedButton(onPressed: (){
              // //   print(Api.imageUrl + '${offersApiController.offersData.value[0].image}');
              // // }, child: Text('test'),),

              //   // heightSizedBox(),
              //   CategoryScrollList(),
              //   heightSizedBox(),
              //   // JobTile(),
                // heightSizedBox(),
                // JobTile(),
                // heightSizedBox(),
                // JobTile(),
                // heightSizedBox(),
                // JobTile(),
               child: AnimationLimiter(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                     padding: EdgeInsets.all(_w / 60),
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     crossAxisSpacing: 8,
                    //     mainAxisSpacing: 2
                    //     // mainAxisExtent: 100.h,
                    //     ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnCount),
                    itemCount: offersApiController.offersData.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return offersApiController
                      //             .offersData.value[index].image!.isEmpty ||
                      //         offersApiController
                      //                 .offersData.value[index].image ==
                      //             null
                      //     ? Container(
                      //         height: 120,
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage(
                      //                     'assets/images/imageone.jpg'),
                      //                 fit: BoxFit.cover),
                      //             color: Colors.amber,
                      //             borderRadius: BorderRadius.circular(10)),
                      //         // child: Center(child: Text('$index')),
                      //       )
                           
                      //     : Container(
                      //         height: 120,
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //                 image:  NetworkImage(
                      //                    Api.imageUrl + '${offersApiController.offersData.value[index].image}'),
                      //                 fit: BoxFit.cover),
                      //             color: Colors.amber,
                      //             borderRadius: BorderRadius.circular(10)),
                      //         // child: Center(child: Text('$index')),
                      //       );
                      return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                duration: Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  child: 
                    offersApiController
                                  .offersData.value[index].image!.isEmpty ||
                              offersApiController
                                      .offersData.value[index].image ==
                                  null
                          ? Container(
                              // height: 120,
                                 margin: EdgeInsets.only(
                        bottom: _w / 30, left: _w / 60, right: _w / 60),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/imageone.jpg'),
                                      fit: BoxFit.cover),
                                  color: Color.fromARGB(255, 185, 182, 182),
                                  borderRadius: BorderRadius.circular(10)),
                              // child: Center(child: Text('$index')),
                            )
                           
                          : Container(
                              // height: 120,
                                 margin: EdgeInsets.only(
                        bottom: _w / 30, left: _w / 60, right: _w / 60),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:  NetworkImage(
                                         Api.imageUrl + '${offersApiController.offersData.value[index].image}'),
                                      fit: BoxFit.cover),
                                  color: Color.fromARGB(255, 185, 182, 182),
                                  borderRadius: BorderRadius.circular(10)),
                              // child: Center(child: Text('$index')),
                            )
                ),
                ),
              );
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8),
                //   child: TitleText(text: 'Vehicles in Ollur...'),
                // ),
                // heightSizedBox(),
                // ListView.separated(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: 10,
                //   separatorBuilder: (context, index) => SizedBox(
                //     height: 10.h,
                //   ),
                //   itemBuilder: (context, index) => Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8),
                //     child: PackageCard(),
                //   ),
                // ),
            //   ],
            // ),
          // ),
        ),
      ),
    );
  }
}
