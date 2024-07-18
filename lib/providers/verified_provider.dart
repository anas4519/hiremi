import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationNotifier extends StateNotifier<bool> {
  VerificationNotifier() : super(false);

  void verify() {
    state = true;
  }

  void unverify() {
    state = false;
  }
}

final verificationProvider =
    StateNotifierProvider<VerificationNotifier, bool>((ref) {
  return VerificationNotifier();
});
