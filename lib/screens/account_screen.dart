import 'package:flutter/material.dart';

class Account_Screen extends StatelessWidget {
  const Account_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Account',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}