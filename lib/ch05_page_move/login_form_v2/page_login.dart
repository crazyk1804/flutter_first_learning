import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../constants.dart';
import 'state_simple.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(
    text: 'your_name@gmail.com'
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'input password'
  );

  void _onLogin(BuildContext context) {
    final String email = _emailController.text;
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);
    state.setEmail(email);

    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void _onCancel() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
          children: [
            Hero(
              tag: 'heoro',
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/vamb_torso.jpeg'),
                backgroundColor: Colors.transparent,
                radius: 100,
              )
            ),

            SizedBox(height: 45),
            TextFormField(
              key: Key('email'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _emailController,
            ),

            SizedBox(height: 15),
            TextFormField(
              key: Key('password'),
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _passwordController,
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Log In'),
                  onPressed: () => _onLogin(context),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () => _onCancel(),
                )
              ]
            )
          ]
        )
      )
    );
  }
}