import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 15, 136, 236), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 14.w,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Adarsh Jose',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'testmail@gmail.com',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+91 9526162457',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  listTile(iconlead: Icons.home_outlined, text: 'About Us'),
                  listTile(iconlead: Icons.notifications, text: 'Notifications'),
                  listTile(iconlead: Icons.privacy_tip_outlined, text: 'Privacy'),
                  listTile(iconlead: Icons.flag_outlined, text: 'Terms & Conditions'),
                  listTile(iconlead: Icons.support_agent, text: 'Support'),
                  // listTile(),
                  // ListTile(
                  //   leading: Icon(Icons.home),
                  //   title: Text('Notifications'),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.home),
                  //   title: Text('Privacy'),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.home),
                  //   title: Text('Terms & Conditions'),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.home),
                  //   title: Text('Support'),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  //   onTap: () {},
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Account',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500, color: Colors.grey),),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(fontSize: 13.sp,color: Colors.blue,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 13.sp,color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile listTile({required IconData iconlead, required String text}) {
    return ListTile(
      leading: CircleAvatar(radius: 17,child: Icon(iconlead, size: 20,color: Colors.white,),backgroundColor: Color.fromARGB(255, 68, 166, 218),),
      title: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
      trailing: CircleAvatar(radius: 10,child: Icon(Icons.arrow_forward_ios, size: 10,), backgroundColor: Color.fromARGB(255, 68, 166, 218),),
      onTap: () {},
    );
  }
}
