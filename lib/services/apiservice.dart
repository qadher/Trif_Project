import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:trip_calicut/models/searchresponsemodel.dart';

Future enquiryMethod(
    {required String type,
    required String packageType,
    required String packageId,
    required String agencyId,
    required String customerId}) async {
  var res = await http.post(
    Uri.parse(
        'https://trifs.in/api/enquiry/create?type=${type}&package_type=${packageType}&package_id=${packageId}&agency_id=${agencyId}&customer_id=${customerId}'),
  );
  print('res : ${res.body}');

  if (res.statusCode == 200) {
    print('success');
    final exData = jsonDecode(res.body);

    print(exData);
    return res.body;
  } else {
    print('failed');

    final exData = jsonDecode(res.body);

    print(exData);
    return res.statusCode;
  }
}

// search api function
Future<List<Map<String, dynamic>>> searchMethod({
  required String searchText,
}) async {
  var res = await http.post(
    Uri.parse(
        'https://trifs.in/api/search?search=${searchText}&type&limit=10&district='),
  );
  print('res : ${res.body}');

  if (res.statusCode == 200) {
    print('success');
    final exData = jsonDecode(res.body);

    print(exData);
    // return res.body;
    return List.generate(exData['search'].length, (index) {
      return {
        'id': '${exData['search'][index]['id']}',
        'name': '${exData['search'][index]['name']}',
        'image': '${exData['search'][index]['image']}',
        'category': '${exData['search'][index]['category']}',
        // 'price': Random().nextInt(100).toString()
      };
    });
  } else {
    print('failed');

    final exData = jsonDecode(res.body);

    print(exData);
    // return res.statusCode;
    return throw Exception('Failed to load post');
  }
}

 


// class APIService {
//   static var client = http.Client();

//   static Future<EnquiryResponseModel> register(
//     EnquiryResponseModel model,
//   ) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };

//     var url = Uri.http(
//       Config.apiURL,
//       Config.registerAPI,
//     );

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );

//     return registerResponseJson(
//       response.body,
//     );
//   }

// }

// class ApiService {
//   static final client = new http.Client();

//   static Future<String> fetchEnquiryData({String? type}) async {
//     var responses = await client.post(Uri.parse(Api.apiUrl +
//         'enquiry/create?type=Enquiry&package_type=${type}&package_id=1&agency_id=1&customer_id=1'));
//     if (responses.statusCode == 200) {
//       var jsonResponse = responses.body;
//       print(jsonResponse);
//       print('success');
//       return jsonResponse;
//     } else {
//       print('error qadher');
//       throw Exception('Failed to load data');
//     }
//   }
// }

