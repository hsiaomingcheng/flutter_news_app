import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新聞APP', //只在android跟web有效
      home: HomeScreen(),
    );
  }
}