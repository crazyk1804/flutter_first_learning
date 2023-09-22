import 'package:flutter/material.dart';
import 'dart:io';

class RowColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Login Form',
      home: Scaffold(
        body: Container(
          // padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Hero(
                tag: 'heoro',
                child: CircleAvatar(
                  // child: Image.asset('assets/vamb_armed.jpg'),
                  backgroundImage: AssetImage('assets/vamb_torso.jpeg'),
                  // backgroundImage: AssetImage('assets/vamb_armed.jpg'),
                  radius: 58.0
                )
              ),

              SizedBox(height: 45.0),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: 'your_name@gmail.com',
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                )
              ),

              SizedBox(height: 15.0),
              TextFormField(
                initialValue: 'input password',
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                )
              ),

              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Log In'),
                    onPressed: (){},
                  ),

                  SizedBox(width: 10.0),
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: (){ exit(0); },
                  )
                ]
              )

            ]
          )
        )
      )
    );
  }
}

void main() => runApp(RowColumnDemo());