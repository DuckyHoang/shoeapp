import 'package:flutter/material.dart';

class Message_Screen extends StatelessWidget {
  const Message_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'message',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}