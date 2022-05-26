import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Switches extends StatelessWidget {
  final List categoryname;
  Switches({
    Key? key,
    required this.categoryname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          // crossAxisSpacing: 10.0,
          // mainAxisSpacing: 10.0,
        ),
        children: List.generate(
          categoryname.length,
          (index) => SwitchesCard(
            categoryList: categoryname[index],
          ),
        ),
      ),
    );
  }
}

class SwitchesCard extends StatelessWidget {
  final SwitchesList categoryList;
  //create url list
  // final List<String> urlList = [
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  //   'https://www.google.com/',
  // ];

  SwitchesCard({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          print('trip switches clicked');
          Get.toNamed('/trip-switches-webview', arguments: [
            categoryList.url,
          ]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryList.image,
              height: 10.w,
              width: 10.h,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryList.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchesList {
  final String image;
  final String title;
  final String url;

  SwitchesList( {required this.url,required this.image, required this.title});
}

List<SwitchesList> trifSwitches = <SwitchesList>[
  SwitchesList(image: 'assets/trifswitches/zomato.png', title: 'Zomato', url: 'https://www.zomato.com/'),
  SwitchesList(
    image: 'assets/trifswitches/ola.png',
    title: 'Ola',
     url: 'https://www.olacabs.com/'
  ),
  SwitchesList(
    image: 'assets/trifswitches/oyo.png',
    title: 'Oyo',
    url: 'https://www.oyorooms.com/'
  ),
  SwitchesList(
    image: 'assets/trifswitches/redbus.png',
    title: 'Redbus',
    url: 'https://www.redbus.in/'
  ),
  SwitchesList(
    image: 'assets/trifswitches/uber.png',
    title: 'Uber',
    url: 'https://m.uber.com'
  ),
  SwitchesList(
    image: 'assets/trifswitches/swiggy.png',
    title: 'Swiggy',
    url: 'https://www.swiggy.com/'
  ),
  SwitchesList(
    image: 'assets/trifswitches/myshow.png',
    title: 'BookMy',
    url: 'https://in.bookmyshow.com/'
  ),
  SwitchesList(
    image: 'assets/trifswitches/ere.png',
    title: 'zCharge',
    url: 'https://erebsindia.com/'
  ),
];
