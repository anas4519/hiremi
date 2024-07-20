import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';

class UltimateNavBar extends ConsumerStatefulWidget {
  UltimateNavBar({this.initTabIndex = 0, super.key});
  late int initTabIndex;

  @override
  ConsumerState<UltimateNavBar> createState() => _UltimateNavBarState();
}

class _UltimateNavBarState extends ConsumerState<UltimateNavBar> {
  void _onItemTapped(int index) {
    final isVerified = ref.read(verificationProvider);

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
