import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_3/video_10/computer_providers.dart';

class SomeScreen extends ConsumerWidget {
  const SomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = ref.watch(sumProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Some Calculator')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final list = ref.read(numberProvider.notifier).state;
          ref.read(numberProvider.notifier).state = [...list, list.length + 1];
        },
        child: Icon(Icons.add),
      ),

      body: Center(child: Text('Total - $sum', style: TextStyle(fontSize: 24))),
    );
  }
}
