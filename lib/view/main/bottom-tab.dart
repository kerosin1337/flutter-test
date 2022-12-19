import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_platform_test/view/main/major/main.dart';
import 'package:new_platform_test/view/main/profile/profile.dart';
import '../../extension/color_extension.dart';

class BottomTab extends HookWidget {
  const BottomTab({super.key});

  static const List<Widget> _widgetOptions = <Widget>[Main(), Profile()];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(_widgetOptions.length - 1);

    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      body: Container(
        child: Navigator(
          onGenerateRoute: (RouteSettings settings) {
            print(settings.name);
            return MaterialPageRoute(
                builder: (context) =>
                    _widgetOptions.elementAt(selectedIndex.value),
                settings: settings);
          },
        ),
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
