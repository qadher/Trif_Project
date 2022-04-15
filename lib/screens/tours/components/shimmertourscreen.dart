import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerTourScreen extends StatelessWidget {
  ShimmerTourScreen({Key? key}) : super(key: key);

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
              Center(
                child: Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.white,
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
                height: 20,
                width: 100,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
