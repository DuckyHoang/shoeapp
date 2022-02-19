// trang main hiện thanh home, danh mục, mess,...

import 'package:flutter/material.dart';
import 'package:shopshoe/screens/account_screen.dart';
import 'package:shopshoe/screens/cart_screen.dart';
import 'package:shopshoe/screens/category_screen.dart';
import 'package:shopshoe/screens/home_screen.dart';
import 'package:shopshoe/screens/message_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopshoe/widgets/category/category_widget.dart';

class MainScreen extends StatefulWidget {
  final int? index;
  const MainScreen({this.index, Key? key}) : super(key: key);
  static const String id = 'home-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    Message_Screen(),
    Cart_Screen(),
    Account_Screen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? Icons.home : Icons.home_outlined),
            label: 'Home',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: 'Danh mục',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 2 ? IconlyBold.chat : IconlyLight.chat),
            label: 'Thông báo',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? IconlyBold.buy : IconlyLight.buy),
            label: 'Giỏ hàng',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4
                ? CupertinoIcons.person_solid
                : CupertinoIcons.person),
            label: 'Tài khoản',
            //  backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
      ),
    );
  }
}
