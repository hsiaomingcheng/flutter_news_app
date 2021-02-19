import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/left_drawer_item.dart';
import 'package:flutter_news_app/screens/home/components/body.dart';

List<Map> leftDrawerItemList = [
  {
    'id': 0,
    'icon': Icons.business,
    'text': '商業',
    'type': 'business',
  },
  {
    'id': 1,
    'icon': Icons.toys,
    'text': '娛樂',
    'type': 'entertainment',
  },
  {
    'id': 2,
    'icon': Icons.healing,
    'text': '健康',
    'type': 'health',
  },
  {
    'id': 3,
    'icon': Icons.science,
    'text': '科學',
    'type': 'science',
  },
  {
    'id': 4,
    'icon': Icons.sports,
    'text': '運動',
    'type': 'sports',
  },
  {
    'id': 5,
    'icon': Icons.library_add,
    'text': '科技',
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