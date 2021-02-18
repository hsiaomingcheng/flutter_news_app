# flutter_news_app

A example for practice news app.

練習製作新聞APP.    
使用[dio](https://pub.dev/packages/dio)做Http請求，請求新聞data.  
使用[webview_flutter](https://pub.dev/packages/webview_flutter)做webView顯示新聞內容.   
使用[provider](https://pub.dev/packages/provider)做狀態管理，目的為根據左側邊欄選的新聞類別更新新聞卡片內容.

待解決問題：    
如何在home_screen載入的時候預設使用business的new data做展示，目前在initState呼叫provider裡的方法會報錯.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
