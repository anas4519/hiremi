import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider = Provider<PageController>((ref) {
  return PageController();
});

final selectedIndexProvider = StateProvider<int>((ref) {
  return 0;
});
