import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新聞APP'),
      ),
      body: BodyComponent(),
    );
  }
}
