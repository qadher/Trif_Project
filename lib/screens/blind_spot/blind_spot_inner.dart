import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/blind_spot/components/blindSpot_card_list.dart';
import 'package:trip_calicut/screens/camping/Components/camppackagecard.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/travel/componenets/travelpackagecard.dart';

import '../home/components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/categoryscrolllist.dart';
import '../widgets.dart';

class BlindSpotInnerScreen extends StatefulWidget {
  BlindSpotInnerScreen({Key? key}) : super(key: key);

  @override
  State<BlindSpotInnerScreen> createState() => _BlindSpotInnerScreenState();
}

class _BlindSpotInnerScreenState extends State<BlindSpotInnerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final maxLines = 5;
  XFile? _image;

  dynamic _imagePath;

  Future getImageCamera() async {
    final ImagePicker image = ImagePicker();
    _image = await image.pickImage(source: ImageSource.camera);
    if (_image != null) {
      setState(() {});
      _imagePath = _image!.path;
    }
    return null;
  }

  Future getImageGallery() async {
    final ImagePicker image = ImagePicker();
    _image = await image.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {});

      _imagePath = _image!.path;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Blind Spot',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSizedBox(),
                    Container(
                      height: 15.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // getImage();
                                imagepick();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: _image == null
                                    ? Image.asset(
                                        'assets/images/addimage.png',
                                      )
                                    : Image.file(
                                        File(
                                          _imagePath,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                          widthSizedBox(),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // getImage();
                                imagepick();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: _image == null
                                    ? Image.asset(
                                        'assets/images/addimage.png',
                                      )
                                    : Image.file(
                                        File(
                                          _imagePath,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                          widthSizedBox(),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // getImage();
                                imagepick();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: _image == null
                                    ? Image.asset(
                                        'assets/images/addimage.png',
                                      )
                                    : Image.file(
                                        File(
                                          _imagePath,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 18.sp),
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.8)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Spot Name',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Lato',
                            fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 6.5.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.gps_fixed,
                          size: 22.sp,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        label: Text(
                          'Fetch GPS Location',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 18.sp),
                      controller: addressController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.8)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Address 1',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Lato',
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18.sp),
                            controller: streetController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'Street',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Lato',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18.sp),
                            controller: pincodeController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'Pincode',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Lato',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18.sp),
                            controller: districtController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'District',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Lato',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18.sp),
                            controller: stateController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.8)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'State',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Lato',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: maxLines * 24.0,
                      child: TextField(
                        style: TextStyle(fontSize: 18.sp),
                        controller: descriptionController,
                        maxLines: maxLines,
                        decoration: InputDecoration(
                          // isDense: true,
                          filled: true,
                          fillColor: Colors.white54,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.8)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Lato',
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 100.w,
                      height: 6.5.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                        onPressed: () {},
                        child: Text(
                          'Submit Now',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void imagepick() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
              child: Text(
                'Select Source',
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Container(
              height: 8.h,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await getImageCamera();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        ClipOval(
                          child: Icon(
                            Icons.camera,
                          ),
                        ),
                        widthSizedBox(),
                        Text(
                          'Camera',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  heightSizedBox(),
                  InkWell(
                    onTap: () async {
                      await getImageGallery();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        ClipOval(
                          child: Icon(Icons.image),
                        ),
                        widthSizedBox(),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
