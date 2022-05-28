import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';

import '../controllers/promotedpackagesapicontroller.dart';

 
      
class PromotedBannerSliderWidget extends StatelessWidget {
  final String image;
  final VoidCallback onClick;

   PromotedBannerSliderWidget({
    Key? key, required this.image, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(10)),
            child: Stack(
              children: <Widget>[
                Image.network(
                    Api.imageUrl +'$image',
                    fit: BoxFit.cover,
                    width: 1000.0),
                Positioned(
                    top: 0,
                    child: Container(
                      // width: 60.w,
                      decoration:
                          BoxDecoration(
                        color: Colors.grey
                            .withOpacity(0.5),
                        borderRadius:
                            BorderRadius.all(
                                Radius
                                    .circular(
                                        5.0)),
                      ),
    
                      child: Padding(
                        padding:
                            const EdgeInsets
                                    .symmetric(
                                horizontal: 4,
                                vertical: 2),
                        child: Text(
                            'Promoted',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              color: Colors
                                  .white,
                              fontFamily:
                                  'Lato',
                            )),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
