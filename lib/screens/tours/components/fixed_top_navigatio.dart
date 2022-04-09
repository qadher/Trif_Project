import 'package:flutter/material.dart';

class FixedTopNavigation extends StatelessWidget {
  const FixedTopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios,
                color: Colors.white,
                size: 25,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                radius: 20,
                child: Icon(Icons.search,
                color: Colors.black,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
