import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_platform_test/view/main/major/main.dart';
import 'package:new_platform_test/view/main/profile/profile.dart';
import '../../extension/color_extension.dart';

class BottomTab extends HookWidget {
  BottomTab({super.key});

  static final List<String> titles = ['Главная', 'Профиль'];

  static const List<Widget> _widgetOptions = <Widget>[
    Main(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(titles.length - 1);

    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: ColorsNP.darkBlue,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        title: Text(titles[selectedIndex.value]),
      ),
      body: Container(
        child: _widgetOptions.elementAt(selectedIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: selectedIndex.value,
        selectedItemColor: ColorsNP.purple,
        unselectedItemColor: ColorsNP.lightPurple,
        onTap: onItemTapped,
      ),
    );
  }
}
