import 'package:flutter/material.dart';
import 'package:sungaipenuhkota/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sungai Penuh Kota',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sungaipenuhkota(),
    );
  }
}
