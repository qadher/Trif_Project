import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/keraladistrictcardcontroller.dart';

class District extends StatelessWidget {
  final KeralaDistrictCardController controller =
      Get.put(KeralaDistrictCardController());

  District({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      // width: 17.w,
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount:
                  //data.length,
                  controller.districtData.value.length,
              separatorBuilder: (context, index) => SizedBox(),
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/toursinglepage',arguments: [
                 controller.districtData.value[index].id,
                 
                 controller.districtData.value[index].image,
                 controller.districtData.value[index].name,
                
                 
                 ],  );
                  },
                  child: Column(
                    children: [
                      Container(
                        //background image
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              Api.imageUrl +
                                  '${controller.districtData.value[index].image!}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          controller.districtData.value[index].name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class DistrictCard extends StatelessWidget {
  const DistrictCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Container(
            //background image
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage('assets/images/imageone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text('Calicut'),
          )
        ],
      ),
    );
  }
}
