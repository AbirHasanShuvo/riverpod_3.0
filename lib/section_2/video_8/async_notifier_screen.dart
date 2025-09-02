import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_8/async_notifier.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(GreetingAsyncNotifierProvider);
    final greetingAsyncNotifier = ref.watch(
      GreetingAsyncNotifierProvider.notifier,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Async Notifier Demo')),
      body: Center(
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (g) => Text(g, style: TextStyle(fontSize: 24)),
          error: (_, e) => Text('Error: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => greetingAsyncNotifier.refreshGreeting(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
