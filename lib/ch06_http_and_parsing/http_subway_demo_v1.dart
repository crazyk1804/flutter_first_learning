import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _response = '';

  _httpGet(var url) async {
    var response = await http.get(url);
    String res = response.body;
    print('response >> $res');
    setState(() {
      _response = res;
    });
  }

  @override
  void initState() {
    super.initState();
    _httpGet(Uri.http(METRO_SITE, '$METRO_PATH서울'));
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(title: Text('Parsing subway realtime arrival')),
      body: Center(
        child: Text(_response)
      )
    );
  }
}

class SubwayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}

void main() => runApp(SubwayDemo());