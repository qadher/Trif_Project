import 'package:flutter/material.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';

class JobInnerScreen extends StatelessWidget {
  const JobInnerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'JCB Operator',
        ),
      ),
      body: Stack(
  children: <Widget>[
    ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          child: Text('item $index'),
          height: 40,
          color: Colors.blueGrey,
          margin: EdgeInsets.all(14),
        );
      }
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        height: 30,
        width: 300,
        color: Colors.blue,
        child: Text('This is a title')
      ),
    ),
  ],
),
    );
  }
}