import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class ThirdRoute extends StatelessWidget {
  final link;

  const ThirdRoute({Key? key, required this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(link),
        ),
        body: WebViewExample(link: link));
  }
}

class WebViewExample extends StatefulWidget {
  final link;

  const WebViewExample({Key? key, this.link}) : super(key: key);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.link,
    );
  }
}
