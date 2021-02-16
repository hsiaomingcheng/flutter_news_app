import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; //call api用

class LeftDrawerItem extends StatefulWidget {
  final IconData icon;
  final String text, type;
  final bool isActive;
  final num itemId;

  const LeftDrawerItem({
    Key key,
    this.icon,
    this.text,
    this.isActive = false,
    this.itemId,
    this.type,
  }) : super(key: key);

  @override
  _LeftDrawerItemState createState() => _LeftDrawerItemState();
}

class _LeftDrawerItemState extends State<LeftDrawerItem> {
  var itemColor;

  @override
  void initState() {
    super.initState();
    _setItemColor();
  }

  //取得新聞資訊
  _getNewsData(category) async {
    var apiUrl =
        'http://newsapi.org/v2/top-headlines?country=tw&category=$category&apiKey=1d2378b6c5aa41709df3dbbe17bd23a3';

    var result = await Dio().get(apiUrl);

    setState(() {
      //目前可以透過點擊不同的item取得相對應的新聞類別
      //問題在於，如何透過狀態的管理使得同層的body可以取得新的新聞data，從而使body的newsCard更新
      //最後再把_getNewsData抽成共用方法，就不用在body跟leftDrawer都寫一次同樣的方法
      print(result.data['articles']);
    });
  }

  //統一管理item顏色
  _setItemColor() {
    itemColor = widget.isActive ? Colors.blue : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        color: this.itemColor,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          color: this.itemColor,
        ),
      ),
      onTap: () {
        _getNewsData(widget.type);
        print(widget.itemId);
      },
    );
  }
}
