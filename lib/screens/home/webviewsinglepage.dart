import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSinglePage extends StatelessWidget {
   WebViewSinglePage({Key? key}) : super(key: key);

   final url = Get.arguments[0];
   final name = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('$name',style: TextStyle(color: Colors.blue),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: '$url',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
