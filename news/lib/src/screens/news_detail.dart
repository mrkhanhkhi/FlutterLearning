import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Text('Im a news detail'),
    );
  }
}