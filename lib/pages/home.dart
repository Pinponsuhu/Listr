import 'package:flutter/material.dart';
import 'package:listr/widgets/addWidet.dart';
import 'package:listr/widgets/homeWidget.dart';
import 'package:listr/widgets/settingsWidget.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {
      'name': 'Home',
      'widget': const HomeWidget(),
    },
    {
      'name': 'Add',
      'widget': const AddWidget(),
    },
    {
      'name': 'Settings',
      'widget': const SettingsWidget(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex]['widget'],
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.black,
        inactiveIconColor: Colors.grey[300],
        bottomPadding: 6,
        waterDropColor: const Color(0XFFFFEE58),
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(filledIcon: Icons.add, outlinedIcon: Icons.add_outlined),
          BarItem(
              filledIcon: Icons.settings,
              outlinedIcon: Icons.settings_outlined),
        ],
        selectedIndex: _currentIndex,
        onItemSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
