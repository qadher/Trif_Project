import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CommonShimmer extends StatelessWidget {
  CommonShimmer({Key? key}) : super(key: key);

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
                  itemBuilder: (context, index) => Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
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
                  separatorBuilder: (context, index) => SizedBox(
                    width: 6,
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
              ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
