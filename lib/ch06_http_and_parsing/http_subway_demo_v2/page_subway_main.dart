import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vergin_flight/constants.dart';

class SubwayArrival {
  int _rowNum = 0;
  String _subwayId = '';
  String _trainLineNm = '';
  String _subwayHeading = '';
  String _arvlMsg2 = '';

  SubwayArrival(
      this._rowNum,
      this._subwayId,
      this._trainLineNm,
      this._subwayHeading,
      this._arvlMsg2
  );

  String get arvlMsg2 => _arvlMsg2;
  String get subwayHeading => _subwayHeading;
  String get trainLineNm => _trainLineNm;
  String get subwayId => _subwayId;
  int get rowNum => _rowNum;
}

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _rowNum = 0;
  String _subwayId = '';
  String _trainLineNm = '';
  String _subwayHeading = '';
  String _arvlMsg2 = '';

  _httpGet(var url) async {
    var response = await http.get(url);
    String responseBody = response.body;
    print('response >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if(errorMessage['status'] != STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        _rowNum = -1;
        _subwayId = '';
        _trainLineNm = '';
        _subwayHeading = '';
        _arvlMsg2 = errMessage;
      });
      return;
    }

    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;
    List<SubwayArrival> list = List.generate(cnt, (int i) {
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'] ?? '',
        item['subwayId'] ?? '',
        item['trainLineNm'] ?? '',
        item['subwayHeading'] ?? '',
        item['arvlMsg2'] ?? '',
      );
    });

    SubwayArrival first = list[0];
    setState(() {
      _rowNum = first._rowNum;
      _subwayId = first._subwayId;
      _trainLineNm = first._trainLineNm;
      _subwayHeading = first._subwayHeading;
      _arvlMsg2 = first._arvlMsg2;
    });
  }

  @override
  void initState() {
    super.initState();
    _httpGet(Uri.http(METRO_SITE, '$METRO_PATH서울'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('지하철 실시간 정보')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('rowNum: $_rowNum'),
            Text('subwayId: $_subwayId'),
            Text('trainLineNm: $_trainLineNm'),
            Text('subwayHeading: $_subwayHeading'),
            Text('arvlMsg2: $_arvlMsg2'),
          ]
        )
      )
    );
  }
}