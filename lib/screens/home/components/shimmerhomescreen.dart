import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerHomeScreen extends StatelessWidget {
  ShimmerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 224, 224, 224),
      highlightColor: Color.fromARGB(255, 245, 245, 245),
      enabled: true,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              //category
              Container(
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
                    12,
                    (index) => Container(
                      //padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 6.w,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 10,
                            width: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                height: 15.h,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 15.h,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                    8,
                    (index) => Container(
                      //padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 6.w,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 10,
                            width: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
