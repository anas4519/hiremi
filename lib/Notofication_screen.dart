import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Custom_Widget/verified_notification.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  List<Widget> notifications = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    prefs = await SharedPreferences.getInstance();
    bool isVerifiedNotificationVisible = prefs.getBool('isVerifiedNotificationVisible') ?? true;

    if (isVerifiedNotificationVisible) {
      notifications = [
        VerifiedNotification(onClose: () {
          setState(() {
            notifications.removeAt(0);
            prefs.setBool('isVerifiedNotificationVisible', false);
          });
        }),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVerified = ref.watch(verificationProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Sizes.responsiveSm(context)),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.notifications),
              color: AppColors.primary,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.bgBlue),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: !isVerified
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/Mail-bro 1.png', height: screenHeight * 0.3),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      width: screenWidth * 0.8,
                      child: const Text(
                        'NNN: No New Notifications! Please explore\nHiremi applications for a while.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: notifications.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: screenHeight * 0.01);
                },
                itemBuilder: (BuildContext context, int index) {
                  return notifications[index];  
                },
              ),
      ),
    );
  }
}
