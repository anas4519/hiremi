import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/Custom_Widget/verified_notification.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/providers/notification_provider.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final notificationsNotifier = ref.watch(notificationsProvider.notifier);
    final notifications = ref.watch(notificationsProvider);
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
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.notifications),
            color: AppColors.primary,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.bgBlue),
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
                  return SizedBox(height: screenHeight*0.01);
                },
                itemBuilder: (BuildContext context, int index) {
                  return VerifiedNotification(
                    onClose: () => notificationsNotifier.removeNotification(index),
                  );
                },
              ),
      ),
    );
  }
}
