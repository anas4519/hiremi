import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/applies_screen.dart';
import 'package:hiremi_version_two/queries_screen.dart';

class UltimateNavBar extends StatefulWidget {
  const UltimateNavBar({Key? key}) : super(key: key);

  @override
  State<UltimateNavBar> createState() => _UltimateNavBarState();
}

class _UltimateNavBarState extends State<UltimateNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const AppliesScreen(),
    const QueriesScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(
          ),
          child: const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.all_inclusive,
                  color: Color(0xFFC1272D),
                  size: 30,
                ),
                Text(
                  'HIREMI',
                  style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                ),
                Text(
                  '360',
                  style: TextStyle(fontSize: 6, color: Color(0xFFC1272D)),
                )
              ],
            ),
          ),
          onPressed: () {
            // Define the action for the FloatingActionButton here
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 90,
        shape: const CircularNotchedRectangle(
          
        ),
        notchMargin: 8.0,
        color: Colors.transparent,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_rounded),
              label: 'Applies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined),
              label: 'Queries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black,
          selectedItemColor: AppColors.primary,
          backgroundColor: Colors.transparent,
          selectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }
}
