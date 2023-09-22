import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  static const String _title = 'Container 위젯 데모';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
              child: Text('단순 컨테이너'),
            ),

            Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Container(
                color: Colors.yellow,
                child: Text('중첩 컨테이너'),
              )
            )

          ]
        )
      )
    );
  }
}

void main() => runApp(ContainerDemo());