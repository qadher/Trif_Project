import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/controllers/truckingpackageapicardcontroller.dart';

import '../../../constant/api.dart';
import '../../home/components/titletext.dart';

class PackageCardTrecking extends StatelessWidget {
  final TruckingPackageApiCardController  controller = Get.put(TruckingPackageApiCardController());

   PackageCardTrecking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.truckingPackageData.value.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.toNamed('/singlepage',arguments: [
                 controller.truckingPackageData.value[index],
                 controller,
                 controller.truckingPackageData.value[index].image,
                 controller.truckingPackageData.value[index].name,
                 controller.truckingPackageData.value[index].offerAmount,
                 controller.truckingPackageData.value[index].district,
                 
                 ],  );
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      controller.truckingPackageData.value[index].image!.isEmpty ||
                              controller.truckingPackageData.value[index].image ==
                                  null
                          ? Container(
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/imageone.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(Api.imageUrl +
                                      '${controller.truckingPackageData.value[index].image}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.5,
                                        child: Text(
                                          '${controller.truckingPackageData.value[index].name}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lato',
                                              color:
                                                  Colors.black.withOpacity(0.5)),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            size: 18,
                                            color: Color(0xFF00A6F6),
                                          ),
                                          controller
                                                          .truckingPackageData
                                                          .value[index]
                                                          .district ==
                                                      null ||
                                                  controller
                                                      .truckingPackageData
                                                      .value[index]
                                                      .district!
                                                      .isEmpty
                                              ? Text(
                                                  'Wayanad',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'Lato',
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                )
                                              : Text(
                                                  '${controller.truckingPackageData.value[index].district}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'Lato',
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '₹${controller.truckingPackageData.value[index].offerAmount}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF00A6F6)),
                                        ),
                                        Text(
                                          '₹${controller.truckingPackageData.value[index].avgAmount}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              // line text
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          '${controller.truckingPackageData.value[index].advAmount}%Off',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF6B100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Provided by ',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                Color.fromARGB(255, 58, 58, 58)),
                                      ),
                                      TextSpan(
                                          text: 'Jiss Travels',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 65, 64, 64))),
                                    ])),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
