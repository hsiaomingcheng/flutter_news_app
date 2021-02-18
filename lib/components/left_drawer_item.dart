import 'package:flutter/material.dart';
import 'package:flutter_news_app/main.dart';
import 'package:provider/provider.dart';

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
        Provider.of<NewsState>(context, listen: false).getNewsData(widget.type);
        Navigator.of(context).pop(); //隱藏側邊欄
      },
    );
  }
}
