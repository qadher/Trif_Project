import 'package:flutter/material.dart';

class TruckingProviders extends StatelessWidget {
  const TruckingProviders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        AssetImage('assets/images/background.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('kannur')
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 2,
          );
        },
      ),
    );
  }
}

