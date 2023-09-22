import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  static const String _title = 'Text 위젯 데모';
  static const String _name = 'Tony Stark';
  static const String _longText = '''
  플러터가 뭐 어쩌고 저쩌고 시발 내가 뭐 그런거까지 다 신경써야 하냐
  인덴트 2글자 어떻게 4자로 바꿔 씨발 쓰기 불편해도 4자로 하고 싶다고
  존나 강제하지 마 이 개새끼들아
  ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('단순 텍스트'),

            Text('Styled Text with $_name', style: TextStyle(
              color: Colors.black,
              fontSize: 20.0, // dp
              background: Paint()
                ..color = Color(0xFFDCEDC8)
                ..style = PaintingStyle.fill,
              fontWeight: FontWeight.bold
            )),

            Text(_longText, overflow: TextOverflow.ellipsis),
          ],

        )
      )
    );
  }

}

void main() => runApp(TextDemo());