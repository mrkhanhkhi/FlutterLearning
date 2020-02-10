import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(SampleApp(window.defaultRouteName));

class SampleApp extends StatelessWidget {
  String router;

  SampleApp(this.router);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: 'vc1',
      routes: {
        '/': (context) => RootPage(),
        'vc1': (context) => Page1(),
      },
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Dịch vụ bổ sung'),
        backgroundColor: Colors.white,
      ),
      child: CupertinoPageScaffold(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, 'vc1');
          },
          child: Text("1 "),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Dịch vụ bổ sung'),
        backgroundColor: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          print('object111');
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Cell1();
              } else {
                return Cell2();
              }
            },
            itemCount: 2,
          ),
        ),
      ),
      backgroundColor: Color(0xffF7F9FB),
    );
  }
}

class Cell1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(151, 151, 151, 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 12,
          top: 12,
          bottom: 12,
        ),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.child_friendly,
                size: 50,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hành lý ký gửi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            color: Color(0xff0E162C),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Gói (Bag) 20kgs',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            color: Color(0xff0E162C),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '350.000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                color: Color(0xff3575F0),
                              ),
                            ),
                            Text(
                              ' đ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                color: Color(0xff3575F0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.right_chevron,
                      size: 25.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cell2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(151, 151, 151, 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: fix(),
    );
  }

  Row fix() {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.child_friendly,
                size: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Suất ăn',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Color(0xff0E162C),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Jet café',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        color: Color(0xff0E162C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
