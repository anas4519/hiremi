import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/verified_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding/decoding

final notificationsProvider = StateNotifierProvider<NotificationsNotifier, List<Widget>>((ref) {
  return NotificationsNotifier();
});

class NotificationsNotifier extends StateNotifier<List<Widget>> {
  NotificationsNotifier() : super([]) {
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = prefs.getString('notifications') ?? '[]';
    final notificationsList = jsonDecode(notificationsJson) as List<dynamic>;

    state = notificationsList.map((notification) {
      // Deserialize each notification and create a VerifiedNotification widget
      return VerifiedNotification(
        onClose: () => removeNotification(state.indexOf(notification)),
      );
    }).toList();
  }

  Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = jsonEncode(state.map((notification) {
      // Serialize each notification widget
      // Here, we assume VerifiedNotification can be serialized to a JSON object.
      return {}; // Replace this with actual serialization code
    }).toList());

    await prefs.setString('notifications', notificationsJson);
  }

  void removeNotification(int index) {
    state = [...state]..removeAt(index);
    _saveNotifications();
  }
}
