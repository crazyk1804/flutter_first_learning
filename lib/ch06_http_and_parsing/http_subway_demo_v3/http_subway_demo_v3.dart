import 'package:flutter/material.dart';
import 'package:vergin_flight/ch06_http_and_parsing/http_subway_demo_v3/page_subway_info.dart';

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