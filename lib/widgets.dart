import 'package:flutter/material.dart';
Widget heightSizedBox() {
  return SizedBox(
    height: 12,
  );
}

Widget widthSizedBox() {
  return SizedBox(
    width: 10,
  );
}

Container providerCard() {
  return Container(
    child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/background.jpg'),
        ),
        heightSizedBox(),
        Text('kannur')
      ],
    ),
  );
}

 Container exploreSlider(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/imageone.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trekking',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  heightSizedBox(),
                                  Text(
                                    'Explore the world of adventure',
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //add button

                            Container(
                              // height: 10.h,
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Explore',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                scrollCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

 

  Column scrollCard() {
    return Column(
      children: [
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
