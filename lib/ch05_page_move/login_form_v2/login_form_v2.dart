import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'page_login.dart';
import 'page_main.dart';
import 'state_simple.dart';

class StateLoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long Form',
      initialRoute: ROOT_PAGE,
      routes: {
        ROOT_PAGE: (context) => LoginPage(),
        MAIN_PAGE: (context) => MainPage(),
      }
    );
  }
}

void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => SimpleState(),
      child: StateLoginDemo()
    )
);