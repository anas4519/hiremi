import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/verified_notification.dart';

final notificationsProvider = StateNotifierProvider<NotificationsNotifier, List<Widget>>((ref) {
  return NotificationsNotifier();
});

class NotificationsNotifier extends StateNotifier<List<Widget>> {
  NotificationsNotifier() : super([
    VerifiedNotification(onClose: () {}),
  ]);

  void removeNotification(int index) {
    state = [...state]..removeAt(index);
  }
}
