import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  _showNextPage(BuildContext context) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => NextPage())
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigator Basic Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showNextPage(context),
          child: Text('Next Page')
        )
      )
    );
  }
}

class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is Second Page')),
      body: Center(
        child: ElevatedButton(
          child: Text('Back'),
          onPressed: () => _backToMainPage(context)
        )
      )
    );
  }
}

class NavigatorPushDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}

void main() => runApp(NavigatorPushDemo());