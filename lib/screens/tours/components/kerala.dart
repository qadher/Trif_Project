import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kerala extends StatelessWidget {
  const Kerala({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: ListView.separated(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount:
                    //data.length,
                    districtImages.length,
                separatorBuilder: (context, index) => SizedBox(),
                itemBuilder: (context, index) => Padding(
                  padding:  EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/placeslistpage',arguments: [districtNames[index]]);
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
                              image: AssetImage(
                               districtImages[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            districtNames[index],
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
              ),
    );
  }
}

//list of district names
List districtNames = [
  'Thiruvananthapuram',
  'Kollam',
  'Alappuzha',
  'Pathanamthitta',
  'Kottayam',
  'Idukki',
  'Ernakulam',
  'Thrissur',
  'Palakkad',
  'Malappuram',
  'Kozhikode',
  'Wayanad',
  'Kannur',
  'Kasaragod',
];
List districtImages = [
  'assets/images/districts/trivandrum.jpeg',
  'assets/images/districts/kollam.jpeg',
  'assets/images/districts/alappuzha.jpeg',
  'assets/images/districts/pathanamthitta.jpeg',
  'assets/images/districts/kottayam.jpeg',
  'assets/images/districts/idukki.jpeg',
  'assets/images/districts/kochi.jpeg',
  'assets/images/districts/thrissur.jpeg',
  'assets/images/districts/palakkad.jpeg',
  'assets/images/districts/malappuram.jpeg',
  'assets/images/districts/calicut.jpeg',
  'assets/images/districts/wayanad.jpeg',
  'assets/images/districts/kannur.jpeg',
  'assets/images/districts/kasargod.jpeg',
];