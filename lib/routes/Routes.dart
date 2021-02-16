import 'package:flutter/material.dart';

//組件
import '../screens/news/news_screen.dart';

//配置路由
final routes = {
  '/news': (context, {arguments}) => NewsScreen(arguments: arguments),
};

//固定寫法
var onGenerateRoute = (RouteSettings settings) {
  //這個onGenerateRoute範例與官方的不同，原因是這個code為教程老師修改過的
  //附上官方網址：https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments#alternatively-extract-the-arguments-using-ongenerateroute

  // 統一處理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );

      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );

      return route;
    }
  }
};
