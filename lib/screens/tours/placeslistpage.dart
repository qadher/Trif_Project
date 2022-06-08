import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';

import '../../../controllers/keraladistrictcardcontroller.dart';

class PlacesListPage extends StatelessWidget {
  final KeralaDistrictCardController controller = Get.put(KeralaDistrictCardController());

  final placeName = Get.arguments[0];

  PlacesListPage({
    Key? key,
  }) : super(key: key);
  List places = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Places',
          style: TextStyle(color: Colors.blue),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                for (var i = 0; i < controller.districtData.value.length; i++) {
                  if (controller.districtData.value[i].district == placeName) {
                    places.add(controller.districtData.value[i]);
                  }
                }
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 14.h,
                  ),
                  itemCount: places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return places.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              Get.toNamed('/toursinglepage', arguments: [
                                places[index].id,
                              ]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/no_image/noimage_square.jpeg'), fit: BoxFit.cover),
                                      color: Color.fromARGB(255, 134, 134, 134),
                                      borderRadius: BorderRadius.circular(20)),
                                  // child: Center(child: Text('$index')),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    child: places[index].image!.isEmpty || places[index].image == null
                                        ? Image.asset(
                                            'assets/images/imageone.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: Api.imageUrl + '${places[index].image}',
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    '${places[index].name}',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
