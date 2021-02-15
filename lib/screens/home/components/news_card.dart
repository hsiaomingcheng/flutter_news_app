import 'package:flutter/material.dart';

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
          //防止圖片連結為空時，AspectRatio對圖片做比例變化會錯誤問題
          if ( this.image != '' ) AspectRatio(
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