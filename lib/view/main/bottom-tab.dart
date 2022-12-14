import 'package:flutter/material.dart';
import 'package:new_platform_test/view/main/profile/profile.dart';

import '../../extension/color_extension.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 0;

  List<String> titles = ['Главная', 'Уроки', 'Профиль'];

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: ColorsNP.darkBlue,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        title: Text(titles[_selectedIndex]),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsNP.purple,
        unselectedItemColor: ColorsNP.lightPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
