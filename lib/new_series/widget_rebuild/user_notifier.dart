import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/widget_rebuild/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String newValue) {
    state = state.copyWith(name: newValue);
  }

  void updateAddress(String newValue) {
    state = state.copyWith(address: newValue);
  }
}
