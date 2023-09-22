import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPage extends StatefulWidget {
  @override
  State createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  static const String CHANNEL_LOCATION = "android/location";
  static const String METHOD_CURRENT_LOCATION = 'getCurrentLocation';
  static const MethodChannel locationChannel = MethodChannel(CHANNEL_LOCATION);

  String _text = "현재위치: 모름";

  _checkPermission() async {
    return await Permission.location.request().isGranted;
  }

  _refresh() async {
    print('refresh current location');

    String _newText;
    try {
      final String result = await locationChannel.invokeMethod(METHOD_CURRENT_LOCATION);
      _newText = '현재 위치는 $result';
    } on PlatformException {
      _newText = '현재 위치는 사용 불가합니다.';
    }

    setState(() { _text = _newText; });
  }

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재위치 채널 데모',
      home: Scaffold(
        appBar: AppBar(title: Text('현재위치 채널 데모')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_text),
              ElevatedButton(
                child: Text('가져오기'),
                onPressed: _refresh,
              )
            ]
          )
        )
      )
    );
  }
}

void main() => runApp(LocationPage());