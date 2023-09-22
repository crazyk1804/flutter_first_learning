import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  State createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo> {
  static final Map<String, String> _buttonStateMap = {
    'OFF': 'ON',
    'ON': 'OFF'
  };
  static const String _title = 'Button 위젯 데모';
  String _buttonState = 'OFF';

  void onClick() {
    setState(() {
      _buttonState = _buttonStateMap[_buttonState]??'NO STATE';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[

            ElevatedButton(
              child: Text('사각버튼'),
              onPressed: onClick,
            ),

            Text(_buttonState),

            ElevatedButton(
              child: Text('둥근버튼'),
              onPressed: onClick,
              style: ButtonStyle(
                // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                // backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  )
                )

              )
            )
          ]

        )
      )
    );
  }
}

void main() => runApp(ButtonDemo());