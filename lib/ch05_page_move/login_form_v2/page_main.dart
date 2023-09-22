import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state_simple.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: Consumer<SimpleState> (
          builder: (context, state, child) {
            return Text('로그인 완료: ${state.getEmail()}');
          }
        )
      )
    );
  }
}