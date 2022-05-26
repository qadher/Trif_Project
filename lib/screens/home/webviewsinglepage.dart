import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSinglePage extends StatelessWidget {
   WebViewSinglePage({Key? key}) : super(key: key);

   final url = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('WebViewSinglePage'),
      // ),
      body: SafeArea(
        child: WebView(
          initialUrl: '$url',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
