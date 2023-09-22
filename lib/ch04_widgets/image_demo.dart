import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  static const String _title = 'Image 위제 데모';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/vamb_armed.jpg'),
            // Image.asset('assets/vamb_torso.jpeg'),
          ]

        )
      )
    );
  }
}

void main() => runApp(ImageDemo());