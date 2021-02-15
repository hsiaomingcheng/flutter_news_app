import 'package:flutter/material.dart';
import 'dart:convert'; //翻譯JSON用
import 'package:dio/dio.dart'; //call api用

import 'news_card.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          children: [
            //這裡需注意，必須寫一個當資料還沒取到時的處理，否則會報錯
            if (this._list.length > 0)
              ...List.generate(
                this._list.length,
                (index) => Column(
                  children: [
                    NewsCard(
                      image: this._list[index]['urlToImage'] == null ? '' : this._list[index]['urlToImage'],
                      title: this._list[index]['title'] == null ? '' : this._list[index]['title'],
                      sourceName: this._list[index]['source']['name'] == null ? '' : this._list[index]['source']['name'],
                    ),
                    Divider(
                      color: Colors.black,
                    )
                  ],
                )
              ),
          ],
        ),
      ),
    );
  }
}