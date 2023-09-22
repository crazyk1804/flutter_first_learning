import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  _showNextPage(BuildContext context) => Navigator.pushNamed(context, '/next');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Next'),
          onPressed: () => _showNextPage(context)
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
      appBar: AppBar(title: Text('This is Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () => _backToMainPage(context),
        )
      )
    );
  }
}

class NavigatorRoutesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/next': (context) => NextPage()
      }
    );
  }
}

void main() => runApp(NavigatorRoutesDemo());
