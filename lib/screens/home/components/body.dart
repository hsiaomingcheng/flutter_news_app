import 'package:flutter/material.dart';
import 'dart:convert'; //翻譯JSON用
import 'package:dio/dio.dart'; //call api用

class BodyComponent extends StatefulWidget {
  BodyComponent({Key key}) : super(key: key);

  @override
  _BodyComponentState createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getNewsData();
  }

  _getNewsData() async {
    var apiUrl =
        'http://newsapi.org/v2/top-headlines?country=tw&category=business&apiKey=1d2378b6c5aa41709df3dbbe17bd23a3';

    var result = await Dio().get(apiUrl);

    setState(() {
      this._list = result.data['articles'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: [
          //這裡需注意，必須寫一個當資料還沒取到時的處理，否則會報錯
          if (this._list.length > 0) NewsCard(
            image: this._list[0]['urlToImage'],
            title: this._list[0]['title'],
            sourceName: this._list[0]['source']['name'],
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key, 
    @required this.title, 
    @required this.sourceName, 
    @required this.image,
  }) : super(key: key);

  final String title, sourceName, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, //圖片以16:9方式顯示
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(this.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(this.sourceName),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
