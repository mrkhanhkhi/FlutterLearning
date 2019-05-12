import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
            child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/ironman.jpeg'),
            ),
            Text(
              'Tony Stark',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Super hero',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '0123456789',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'stark@avengers.com.vn',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
