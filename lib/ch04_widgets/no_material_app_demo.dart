import 'package:flutter/material.dart';

class NoMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material',
      home: Scaffold(
        appBar: AppBar(title: Text('app bar')),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Text('This is not Material App', textDirection: TextDirection.ltr)
        )
      )
    );
  }
}

void main() => runApp(NoMaterialApp());