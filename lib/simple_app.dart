import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title: '미친 플러터 쌍놈 새끼들아',
      home: Scaffold(
        appBar: AppBar(title: Text('인덴트를 시발 2공백으로 강제하면')),
        // body: Text('존나 짜증나지 병신들아')
        // body: _FirstStatelessWidget(),
        body: _FirstStatefulWidget(),
      )
    ));

class _FirstStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('stateless widget');
  }
}

class _FirstStatefulWidget extends StatefulWidget {
  @override
  State createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<_FirstStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return const Text('존나 짜증나 병신들아');
  }
}