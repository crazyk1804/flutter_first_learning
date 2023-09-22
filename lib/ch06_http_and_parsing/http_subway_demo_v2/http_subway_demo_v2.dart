import 'package:flutter/material.dart';
import 'page_subway_main.dart';

class SubwayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage()
    );
  }
}

void main() => runApp(SubwayDemo());