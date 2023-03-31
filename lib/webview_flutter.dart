import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class Sungaipenuhkota extends StatefulWidget {
  const Sungaipenuhkota({Key? key}) : super(key: key);

  @override
  State<Sungaipenuhkota> createState() => _SungaipenuhkotaState();
}

class _SungaipenuhkotaState extends State<Sungaipenuhkota> {
  late WebViewController webViewController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: Column(
            children: [
              progress < 1
                  ? SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(
                        value: progress,
                        color: Colors.red,
                        backgroundColor: Colors.white,
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: WebView(
                  initialUrl: 'https://sungaipenuhkota.go.id',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onProgress: (progress) => setState(() {
                    this.progress = progress / 100;
                  }),
                  gestureNavigationEnabled: true,
                  geolocationEnabled: false, //support geolocation or not
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
