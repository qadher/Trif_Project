import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<Map<String, String>> splashData = [
  {
    "head": "Travel Diaries",
    "title": "Let’s Enjoy your Dream \nVacation...",
    "image": "assets/images/onboarding 1.jpg"
  },
  {
    "head": "Academic Success",
    "title": "Study Abroad and chase\nyour Dreams...",
    "image": "assets/images/onboarding 2.jpg"
  },
  {
    "head" : "Career Advancement",
    "title": "Land to your Dream\nJob...",
    "image": "assets/images/onboarding 3.jpg"
  },
];
Container onBoardingImage(int index) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              splashData[index]['image']!,
            ),
            fit: BoxFit.cover)),
  );
}

// SizedBox onBoardingImage(BuildContext context, int index) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height * .18,
//     width: MediaQuery.of(context).size.width * .6,
//     child: AspectRatio(
//       aspectRatio: 9 / 16,
//       child: Image.asset(
//         splashData[index]['image']!,
//         fit: BoxFit.fill,
//       ),
//     ),
//   );
// }
Text onBoardingTextHead(int index) {
  return Text(
    splashData[index]['head']!,
    style: TextStyle(
      color: Color.fromARGB(255, 112, 7, 7),
      fontWeight: FontWeight.bold,
      fontSize: 24.sp,
      fontFamily: 'SpectralSC',
    ),
  );
}

Text onBoardingText(int index) {
  return Text(
    splashData[index]['title']!,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontFamily: "Lato",
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Color.fromARGB(255, 255, 255, 255),
      height: 1.5,
    ),
  );
}
