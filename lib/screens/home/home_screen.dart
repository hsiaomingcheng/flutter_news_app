import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/left_drawer_item.dart';
import 'package:flutter_news_app/screens/home/components/body.dart';

List<Map> leftDrawerItemList = [
  {
    'id': 0,
    'icon': Icons.business,
    'text': 'business',
    'type': 'business',
  },
  {
    'id': 1,
    'icon': Icons.toys,
    'text': 'entertainment',
    'type': 'entertainment',
  },
  {
    'id': 2,
    'icon': Icons.healing,
    'text': 'health',
    'type': 'health',
  },
  {
    'id': 3,
    'icon': Icons.science,
    'text': 'science',
    'type': 'science',
  },
  {
    'id': 4,
    'icon': Icons.sports,
    'text': 'sports',
    'type': 'sports',
  },
  {
    'id': 5,
    'icon': Icons.library_add,
    'text': 'technology',
    'type': 'technology',
  },
];

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
            SizedBox(
              height: 25,
            ),
            if (leftDrawerItemList.length > 0) ...List.generate(
              leftDrawerItemList.length,
              (index) => Column(
                children: [
                  LeftDrawerItem(
                    type: leftDrawerItemList[index]['type'],
                    itemId: leftDrawerItemList[index]['id'],
                    icon: leftDrawerItemList[index]['icon'],
                    text: leftDrawerItemList[index]['text'],
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}