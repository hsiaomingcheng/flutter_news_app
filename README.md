# flutter_news_app

A example for practice news app.

練習製作新聞APP.    
使用[dio](https://pub.dev/packages/dio)做Http請求，請求新聞data.  
使用[webview_flutter](https://pub.dev/packages/webview_flutter)做webView顯示新聞內容.   
使用[provider](https://pub.dev/packages/provider)做狀態管理，目的為根據左側邊欄選的新聞類別更新新聞卡片內容.

展示影片: [https://youtu.be/96SKXL3-BOQ](https://youtu.be/96SKXL3-BOQ)

2021/3/6    
 1. 新增左邊抽屜active樣式
 2. 新增當切換新聞類別時，新聞列表自動回到最上功能
 
2021/3/10   
 1. add Icons
 2. change http to https
 
2021/03/12  
 1. webview新增啟用javascript參數設定，解決webview會有圖片不載入問題
    可能是因為被載入的網頁有用Js做一些事情，若禁用了這些事情就不會發生，多少會影響到該網頁原本的使用者體驗設計

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
