import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  SwitchesCard({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categoryList.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
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

  SwitchesList({required this.image, required this.title});
}

List<SwitchesList> trifSwitches = <SwitchesList>[
  SwitchesList(image: 'assets/trifswitches/zomato.png', title: 'Zomato'),
  SwitchesList(
    image: 'assets/trifswitches/ola.png',
    title: 'Ola',
  ),
  SwitchesList(
    image: 'assets/trifswitches/oyo.png',
    title: 'Oyo',
  ),
  SwitchesList(
    image: 'assets/trifswitches/redbus.png',
    title: 'Redbus',
  ),
  SwitchesList(
    image: 'assets/trifswitches/uber.png',
    title: 'Uber',
  ),
  SwitchesList(
    image: 'assets/trifswitches/swiggy.png',
    title: 'Swiggy',
  ),
  SwitchesList(
    image: 'assets/trifswitches/myshow.png',
    title: 'BookMy',
  ),
  SwitchesList(
    image: 'assets/trifswitches/ere.png',
    title: 'zCharge',
  ),
];
