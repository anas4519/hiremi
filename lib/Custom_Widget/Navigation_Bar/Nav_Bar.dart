import 'package:flutter/material.dart';

import '../../Utils/AppSizes.dart';
import '../../Utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = (screenWidth - (4 * 50)) / 5;
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black38,
          blurRadius: 10,
          offset: Offset(4,4)
          )
        ]
      ),
      child:  BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding:  EdgeInsets.all(Sizes.responsiveXxs(context)),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavItem(Icons.home_filled, 'HOME', 0),
              _buildNavItem(Icons.event_note_sharp, 'APPLIES', 1),
              SizedBox(width: Sizes.responsiveXxl(context)),
              _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
              _buildNavItem(Icons.person_outline, 'PROFILE', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: _selectedIndex == index
                ? AppColors.primary
                : Colors.black,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
