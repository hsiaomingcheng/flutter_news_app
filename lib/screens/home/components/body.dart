import 'package:flutter/material.dart';
import 'package:flutter_news_app/main.dart';
import 'package:provider/provider.dart';

import 'news_card.dart';

class BodyComponent extends StatefulWidget {
  BodyComponent({Key key}) : super(key: key);

  @override
  _BodyComponentState createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  @override
  void didChangeDependencies() {
    if (Provider.of<NewsState>(context).newCardList.length == 0) {
      Provider.of<NewsState>(context, listen: false).getNewsData();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          children: [
            if (Provider.of<NewsState>(context).newCardList.length > 0)
              Text(Provider.of<NewsState>(context).newsCategoryText),
            //這裡需注意，必須寫一個當資料還沒取到時的處理，否則會報錯
            if (Provider.of<NewsState>(context).newCardList.length > 0)
              ...List.generate(
                  Provider.of<NewsState>(context).newCardList.length,
                  (index) => Column(
                        children: [
                          NewsCard(
                            image: Provider.of<NewsState>(context)
                                        .newCardList[index]['urlToImage'] ==
                                    null
                                ? ''
                                : Provider.of<NewsState>(context)
                                    .newCardList[index]['urlToImage'],
                            title: Provider.of<NewsState>(context)
                                        .newCardList[index]['title'] ==
                                    null
                                ? ''
                                : Provider.of<NewsState>(context)
                                    .newCardList[index]['title'],
                            sourceName: Provider.of<NewsState>(context)
                                        .newCardList[index]['source']['name'] ==
                                    null
                                ? ''
                                : Provider.of<NewsState>(context)
                                    .newCardList[index]['source']['name'],
                            url: Provider.of<NewsState>(context)
                                        .newCardList[index]['url'] ==
                                    null
                                ? ''
                                : Provider.of<NewsState>(context)
                                    .newCardList[index]['url'],
                          ),
                          Divider(
                            color: Colors.black,
                          )
                        ],
                      )),
          ],
        ),
      ),
    );
  }
}
