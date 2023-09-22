import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title: 'Stateful Widget Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Statefule Widget Demo')),
        body: _MyStatefulWidget(),
      )
    ));

class _MyStatefulWidget extends StatefulWidget {
  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  late String _buttonState;
  String _otherButtonState = '';

  void _onClick() {
    print('_onClick() called');
    setState(() {
      print('setState called');
      if(_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  void _onOtherClicked() {
    print('_onOtherClicked() called');
    setState(() {
      _otherButtonState = 'what the fuck';
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState(): setting default value');
    _buttonState = 'OFF';
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies just called');
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: Text('push the button'),
          onPressed: _onClick,
        ),
        ElevatedButton(
          child: Text('other button: ' + _otherButtonState),
          onPressed: _onOtherClicked,
        ),
        Row(
          children: <Widget>[
            Text('Button State: '),
            Text(_buttonState),
          ]
        )
      ]
    );
    return const Text('This is stateful Widget');
  }

  @override
  void didUpdateWidget(_MyStatefulWidget oldWidget) {
    print('didUpdateWidget called');
  }

  @override
  void deactivate() {
    print('deactivate');
  }

  @override
  void dispose() {
    print('dispose');
  }


  // @override
  // void setState(VoidCallback fn) {
  //
  // }
  //
  // @override
  // void reassemble() {
  //
  // }


}