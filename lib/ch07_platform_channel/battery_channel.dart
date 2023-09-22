import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryPage extends StatefulWidget {
  @override
  State createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  // android의 MainActivity에 가져올 수 있는 채널과 메소드 정의되어 있음
  static const String CHANNEL_BATTERY = 'android/battery';
  static const String METHOD_BATTERY = 'getBatteryLevel';
  static const MethodChannel batteryChannel = MethodChannel(CHANNEL_BATTERY);

  String _text = '배터리 잔량: 모름';

  _refresh() async {
    print('refresh battery level');

    String _newText;
    try {
      final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);
      _newText = '배터리 잔량: $result %';
    } on PlatformException {
      _newText = '배터리 잔량을 알 수 없습니다.';
    }

    setState(() { _text = _newText; });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배터리 채널 데모 v1',
      home: Scaffold(
        appBar: AppBar(title: Text('배터리 채널 데모 V1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_text),
              ElevatedButton(
                child: Text('가져오기'),
                onPressed: _refresh
              )
            ]
          )
        )
      )
    );
  }
}

void main() => runApp(BatteryPage());