import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/models/searchresponsemodel.dart';
import 'package:trip_calicut/widgets.dart';

import '../../services/apiservice.dart';
import '../home/components/titletext.dart';
import '../houseboat/components/packagecard_houseboat.dart';
import '../tours/components/kerala.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPage extends StatelessWidget {
  //controllers
  final TextEditingController searchController = TextEditingController();
  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // child: Form(
                //   key: formKey,
                //   child: CupertinoSearchTextField(
                //     //suggestions ListTile

                //     onChanged: (value) {
                //       print(value);
                //       //call search api
                //       searchMethod(searchText: value);
                //     },
                //     controller: searchController,
                //     backgroundColor: Colors.grey.withOpacity(0.4),
                //     suffixIcon: const Icon(
                //       CupertinoIcons.xmark_circle_fill,
                //       color: Colors.grey,
                //     ),
                //     style: TextStyle(fontSize: 18.sp, color: Colors.black),
                //   ),
                // ),

                // search bar with listtile suggestions
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.4),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                  suggestionsCallback: (pattern) async {
                    print(pattern);
                    return await searchMethod(searchText: pattern);
                  },
                  itemBuilder: (context, Map<String, dynamic> suggestion) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(Api.imageUrl + '${suggestion['image']}'),
                      ),
                      title: Text(suggestion['name']!),
                    );
                  },
                  onSuggestionSelected: (Object? suggestion) {
                    // go to singlepage with category and id
                    print(suggestion);
                    // print suggestion['id'];
                    id:
                    (suggestion as Map<String, dynamic>);
                    category:
                    (suggestion as Map<String, dynamic>);
                    print(suggestion['id']);
                    int id = int.parse(suggestion['id']);
                    if (suggestion['category'] == 'Places') {
                      Get.toNamed('/toursinglepage', arguments: [id]);
                    }
                   else if (suggestion['category'] == 'Packages') {
                      Get.toNamed('/homesinglepagepackage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'Houseboat') {
                      Get.toNamed('/houseboatpackagesinglepage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'Resorts') {
                      Get.toNamed('/resortsinglepage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'OnlyTravelling') {
                      Get.toNamed('/toursinglepage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'Camping') {
                      Get.toNamed('/campingsinglepagepackage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'Trucking') {
                      Get.toNamed('/truckingsinglepage', arguments: [id]);
                    }
                    else if (suggestion['category'] == 'HomeStay') {
                      Get.toNamed('/homestaysinglepage', arguments: [id]);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: TitleText(text: 'Recomended Places'),
              ),
              SizedBox(
                height: 10,
              ),
              Kerala(),
              heightSizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TitleText(text: 'Recomended Packages'),
              ),
              heightSizedBox(),
              RecommendedPackageCardHouseBoat(),
              heightSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
