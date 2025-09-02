import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_5/video_5.dart';

final GreetingAsyncNotifierProvider =
    AsyncNotifierProvider<GreetingAsyncNotifier, String>(
      () => GreetingAsyncNotifier(),
    );

class GreetingAsyncNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    return await ref.read(fakeApiProvider).fetchGreetings();
  }

  Future<void> refreshGreeting() async {
    //this is another method for doing this

    state = await AsyncValue.guard(() async {
      //i have to manually call this loading for the loading view
      state = const AsyncValue.loading();
      return await ref.read(fakeApiProvider).fetchGreetings();
    });
    // try {
    // state = const AsyncValue.loading();
    //   final value = await ref.read(fakeApiProvider).fetchGreetings();
    //   state = AsyncValue.data(value);
    // } catch (e) {
    //   state = AsyncError(e, StackTrace.current);
    // }
  }
}
