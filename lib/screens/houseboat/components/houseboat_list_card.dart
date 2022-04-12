import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';

import '../../../controllers/houseboatapicardcontroller.dart';

class HouseBoatPackageCard extends StatelessWidget {
  final HouseboatApiCardController controller =
      Get.put(HouseboatApiCardController());

  HouseBoatPackageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.houseBoatData.value.length,
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed('/houseboatsinglepage',arguments: [
                 controller.houseBoatData.value[index],
                 controller,
                 controller.houseBoatData.value[index].image,
                 controller.houseBoatData.value[index].name,
                 controller.houseBoatData.value[index].budget,
                 controller.houseBoatData.value[index].district,
                 
                 ],  );
                },
                child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
              
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 135,
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                child: controller.houseBoatData.value[index]
                                            .image!.isEmpty ||
                                        controller.houseBoatData.value[index]
                                                .image ==
                                            null
                                    ? Container(
                                        // height: 135,
                                        // width: 135,
                                        width: MediaQuery.of(context).size.width *
                                            0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/imageone.jpg'),
                                            fit: BoxFit.cover,
              
                                            // NetworkImage(Api.imageUrl + '${controller.houseBoatData.value[index].image}'),
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        // height: 135,
                                        // width: 135,
                                        width: MediaQuery.of(context).size.width *
                                            0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          image: DecorationImage(
                                            image: NetworkImage(Api.imageUrl +
                                                '${controller.houseBoatData.value[index].image}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.houseBoatData.value[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 18,
                                          color: Color(0xFF00A6F6),
                                        ),
                                        Text(
                                          '${controller.houseBoatData.value[index].district}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Verified',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Lato',
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${controller.houseBoatData.value[index].advAmount}%Off',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFF6B100)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].offerAmount}',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF00A6F6)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].budget}/-',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    // line text
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              ));
        }
      },
    );
  }
}
