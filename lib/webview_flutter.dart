import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class Sungaipenuhkota extends StatefulWidget {
  const Sungaipenuhkota({Key? key}) : super(key: key);

  @override
  State<Sungaipenuhkota> createState() => _SungaipenuhkotaState();
}

class _SungaipenuhkotaState extends State<Sungaipenuhkota> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://sungaipenuhkota.go.id',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          geolocationEnabled: false, //support geolocation or not
        ),
      ),
    );
  }
}
