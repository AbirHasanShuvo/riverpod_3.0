import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/widget_rebuild/user.dart';
import 'package:riverpod_v3/new_series/widget_rebuild/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User("The Originals", "Bangladesh")),
);

class NewHome extends ConsumerWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build method is called");
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateName(value),
            ),
            SizedBox(height: 10),

            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).updateAddress(value),
            ),
            SizedBox(height: 10),

            Text(user.name + user.address),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
