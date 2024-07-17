import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/applies_screen.dart';
import 'package:hiremi_version_two/queries_screen.dart';

class CustomNavBarExample extends StatefulWidget {
  @override
  _CustomNavBarExampleState createState() => _CustomNavBarExampleState();
}

class _CustomNavBarExampleState extends State<CustomNavBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const AppliesScreen(),
    const QueriesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Positioned(
            bottom: 20.0, // Adjust this value to move the navigation bar up
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0), // Optional: Add horizontal margin
              decoration: const BoxDecoration(
                color: Colors.white, // Change background color here
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                ), // Change border radius here
                
                
              ),
              child: CustomNavigationBar(
                backgroundColor: Colors.white, // Keep this transparent
                items: [
                  CustomNavigationBarItem(icon: const Icon(Icons.home), title: const Text('Home')),
                  CustomNavigationBarItem(icon: const Icon(Icons.assignment), title: const Text('Applies')),
                  CustomNavigationBarItem(icon: const Icon(Icons.question_answer), title: const Text('Queries')),
                  CustomNavigationBarItem(icon: const Icon(Icons.person), title: const Text('Profile')),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                elevation: 10.0, // Increase the elevation here
              ),
            ),
          ),
        ],
      ),
    );
  }
}

