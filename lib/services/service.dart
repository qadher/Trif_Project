import 'package:http/http.dart' as http;
import 'package:trip_calicut/constant/api.dart';

class ApiManager {
  static final client = new http.Client();

  static Future fetchData({String? api}) async {
    var responses = await client.post(
        Uri.parse(Api.apiUrl + '$api'));
        if (responses.statusCode == 200) {
          var jsonResponse = responses.body;
          return jsonResponse;
        } else {
          throw Exception('Failed to load data');
        }
  }
}



// import 'package:http/http.dart' as http;

// class ApiManager {
//   static final client = new http.Client();

//   static Future fetchDistrictData() async {
//     var responses = await client.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//         if (responses.statusCode == 200) {
//           var jsonResponse = responses.body;
//           return jsonResponse;
//         } else {
//           throw Exception('Failed to load album');
//         }
//   }
// }