import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatelessWidget {
  final arguments;

  const NewsScreen({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新聞內容頁'),
      ),
      body: WebViewComponent(
        webViewUrl: this.arguments['url'],
      ),
    );
  }
}

class WebViewComponent extends StatefulWidget {
  final String webViewUrl;

  const WebViewComponent({
    this.webViewUrl,
  });

  @override
  WebViewComponentState createState() => WebViewComponentState();
}

class WebViewComponentState extends State<WebViewComponent> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.webViewUrl,
    );
  }
}
