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
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 25,),
            ListTile(
              leading: Icon(Icons.business, color: Colors.blue,),
              title: Text('business', style: TextStyle(color: Colors.blue,),),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.toys),
              title: Text('entertaiment'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.healing),
              title: Text('health'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.science),
              title: Text('science'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.sports),
              title: Text('sports'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_add),
              title: Text('technology'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
