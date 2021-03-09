import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart'; //狀態管理套件
import 'package:dio/dio.dart'; //call api用
import './routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsState>(
      create: (_) => NewsState(),
      child: MaterialApp(
        title: '新聞APP', //只在android跟web有效
        home: HomeScreen(),
        onGenerateRoute: onGenerateRoute, //命名路由傳值
      ),
    );
  }
}

class NewsState extends ChangeNotifier {
  String newsCategory = '';
  String newsCategoryText = '';
  List newCardList = [];
  ScrollController controller = ScrollController();

  //取得新聞資訊
  void getNewsData({String category = 'business', String text = '商業'}) async {
    var apiUrl =
        'https://newsapi.org/v2/top-headlines?country=tw&category=$category&apiKey=1d2378b6c5aa41709df3dbbe17bd23a3';

    var result = await Dio().get(apiUrl);

    newCardList = result.data['articles'];

    newsCategory = category;

    newsCategoryText = text;

    notifyListeners();
  }
}
