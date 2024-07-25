import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Profile_Screen.dart';
import 'package:hiremi_version_two/applies_screen.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:hiremi_version_two/queries_screen.dart';
import 'package:hiremi_version_two/verified_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/AppSizes.dart';
import 'Utils/colors.dart';

class NewNavbar extends ConsumerStatefulWidget {
  NewNavbar({this.initTabIndex = 0, super.key});

  late int initTabIndex;

  @override
  ConsumerState<NewNavbar> createState() => _NewNavbarState();
}

class _NewNavbarState extends ConsumerState<NewNavbar> {
  final List<Widget> _pages = [
    const HomePage(),
    const AppliesScreen(),
    const QueriesScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    
    _checkFirstVerification();
    
  }

  
  

  Future<void> _checkFirstVerification() async {
    final prefs = await SharedPreferences.getInstance();
    // final bool isVerified = ref.read(verificationProvider);
    final bool isFirstVerification =
        prefs.getBool('isFirstVerification') ?? true;
        final isVerified = ref.watch(verificationProvider);
    if (isVerified && isFirstVerification) {
      _showVerificationPopup();
      await prefs.setBool('isFirstVerification', false);
    }
  }

  void _onItemTapped(int index) {
    final isVerified = ref.watch(verificationProvider);
    if (!isVerified && (index == 2 || index == 3)) {
      _showPopUp();
    } else {
      setState(() {
        widget.initTabIndex = index;
      });
    }
  }

  void _showPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const CustomAlertbox());
      },
    );
  }

  void _showVerificationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const VerifiedPopup());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isVerified = ref.watch(verificationProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: _pages[widget.initTabIndex],
        bottomNavigationBar: Container(
          height: MediaQuery.sizeOf(context).height * 0.08,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, offset: Offset(4, 4))
              ]),
          child: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 15,
            child: Padding(
              padding: EdgeInsets.all(Sizes.responsiveXxs(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(Icons.home_filled, 'HOME', 0),
                  _buildNavItem(Icons.list_alt_rounded, 'APPLIES', 1),
                  SizedBox(width: Sizes.responsiveXxl(context)),
                  _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
                  _buildNavItem(Icons.person_outline, 'PROFILE', 3),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Transform.scale(
          scale: pi * 0.4,
          child: FloatingActionButton(
              onPressed: () {
                if (!isVerified) {
                  _showPopUp();
                }
              },
              elevation: 4,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.all_inclusive,
                      color: Color(0xFFC1272D),
                      size: 20,
                    ),
                    Text(
                      'HIREMI',
                      style:
                          TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '360',
                      style: TextStyle(fontSize: 6, color: Color(0xFFC1272D)),
                    ),
                  ],
                ),
              )),
        ),
    );
  }

  Widget _buildNavItem(dynamic icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: widget.initTabIndex == index
                ? const Color(0xFFC1272D)
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
