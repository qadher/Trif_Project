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
                    districtNames.length,
                separatorBuilder: (context, index) => SizedBox(),
                itemBuilder: (context, index) => Padding(
                  padding:  EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/placeslistpage',);
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
                               'assets/images/imageone.jpg',
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
  'Alappuzha',
  'Ernakulam',
  'Idukki',
  'Kannur',
  'Kasaragod',
  'Kollam',
  'Kottayam',
  'Kozhikode',
  'Malappuram',
  'Palakkad',
  'Pathanamthitta',
  'Thiruvananthapuram',
  'Thrissur',
  'Wayanad',
];