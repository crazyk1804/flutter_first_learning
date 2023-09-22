import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vergin_flight/constants.dart';

import 'api/subway_api.dart' as api;
import 'model/subway_arrival.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _stationController = TextEditingController(
      text: api.defaultStation
  );
  List<SubwayArrival> _data = [];
  bool _isLoading = false;

  List<Card> _buildCards() {
    print('>>> _data.length ? ${_data.length}');
    if(_data.isEmpty) return [];

    List<Card> res = [];
    for(SubwayArrival info in _data) {
      Card card = Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 10 / 6.5,
              child: Image.asset(
                'assets/vamb_torso.jpeg',
                fit: BoxFit.fitHeight
              )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(info.trainLineNm, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text(info.arvlMsg2, maxLines: 1, overflow: TextOverflow.ellipsis)
                  ]
                )
              )
            )
          ]
        )
      );
      res.add(card);
    }

    return res;
  }

  _getInfo() async {
    setState(() => _isLoading = true);

    String station = _stationController.text;
    var response = await http.get(Uri.http(METRO_SITE, '$METRO_PATH$station'));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if(errorMessage['status'] != STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        print('error >> $errMessage');
        _data = const [];
        _isLoading = false;
      });
      return;
    }
    
    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;
    
    List<SubwayArrival> list = List.generate(cnt, (int i) {
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'] ?? 0,
        item['subwayId'] ?? '',
        item['trainLineNm'] ?? '',
        item['subwayHeading'] ?? '',
        item['arvlMsg2'] ?? '',
      );
    });

    setState(() {
      _data = list;
      _isLoading = false;
    });
  }

  _onClick() {
    _getInfo();
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('지하철 실시간 정보')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                children: [
                  Text('역 이름'),
                  SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: TextField(controller: _stationController),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  ElevatedButton(child: Text('조회'), onPressed: _onClick),
                ]
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('도착정보'),
            ),
            SizedBox(height: 10),
            Flexible(
              child: _isLoading ?
                Center(child: CircularProgressIndicator()) :
                GridView.count(
                  crossAxisCount: 2, children: _buildCards()
                )
            )
          ]
        )
    );
  }
}