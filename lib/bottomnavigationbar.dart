import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/Profile_Screen.dart';
import 'package:hiremi_version_two/applies_screen.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:hiremi_version_two/queries_screen.dart';
import 'package:hiremi_version_two/verified_popup.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewNavbar extends ConsumerStatefulWidget {
  const NewNavbar({Key? key}) : super(key: key);

  @override
  ConsumerState<NewNavbar> createState() => _NewNavbarState();
}

class _NewNavbarState extends ConsumerState<NewNavbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  late List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const AppliesScreen(),
      const QueriesScreen(),
      ProfileScreen(),
    ];
    _checkFirstVerification();
  }

  Future<void> _checkFirstVerification() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isVerified = ref.read(verificationProvider);
    final bool isFirstVerification = prefs.getBool('isFirstVerification') ?? true;

    if (isVerified && isFirstVerification) {
      _showVerificationPopup();
      await prefs.setBool('isFirstVerification', false);
    }
  }

  void _onItemTapped(int index) {
    final isVerified = ref.read(verificationProvider);

    if (!isVerified && (index == 2 || index == 3)) {
      _showPopUp();
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.jumpToPage(index);
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
    final isVerified = ref.read(verificationProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = (screenWidth - (4 * 50)) / 5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages
                .map((page) => Navigator(
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute(
                          builder: (context) => page,
                        );
                      },
                    ))
                .toList(),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home_filled, 'HOME', 0),
                    _buildNavItem(
                        _selectedIndex == 1
                            ? 'images/export_notes red.png'
                            : 'images/export_notes (1).png',
                        'APPLIES',
                        1),
                    SizedBox(
                      width: spacing * 1.5,
                    ),
                    _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
                    _buildNavItem(Icons.person_outline, 'PROFILE', 3),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 35,
              left: screenWidth * 0.5,
              right: screenWidth * 0.5,
              child: CircularPercentIndicator(
                radius: 39,
                lineWidth: 15,
                percent: 0.50,
                progressColor: const Color(0xFFC1272D),
                backgroundColor: Colors.transparent,
                startAngle: 90,
              )),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Center(
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: FloatingActionButton(
                    onPressed: () {
                      if(!isVerified){
                        _showPopUp();
                      }
                    },
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
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
                            style: TextStyle(
                                fontSize: 7, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '360',
                            style: TextStyle(
                                fontSize: 6, color: Color(0xFFC1272D)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
          icon is IconData
              ? Icon(
                  icon,
                  size: 20,
                  color: _selectedIndex == index
                      ? const Color(0xFFC1272D)
                      : Colors.black,
                )
              : Image.asset(
                  icon,
                  color: _selectedIndex == index
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
