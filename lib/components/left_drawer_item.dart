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

  //統一管理item顏色
  _setItemColor() {
    return Provider.of<NewsState>(context).newsCategory == widget.type
        ? Colors.white
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<NewsState>(context).newsCategory == widget.type
          ? Colors.blue
          : Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: this._setItemColor(),
        ),
        title: Text(
          widget.text,
          style: TextStyle(
            color: this._setItemColor(),
          ),
        ),
        onTap: () {
          Provider.of<NewsState>(context, listen: false)
              .getNewsData(category: widget.type, text: widget.text);
          Navigator.of(context).pop(); //隱藏側邊欄

          Provider.of<NewsState>(context, listen: false).controller.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
          // _setItemColor();
        },
      ),
    );
  }
}
