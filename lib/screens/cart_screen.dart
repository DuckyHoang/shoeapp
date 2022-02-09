import 'package:flutter/material.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'cart',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}