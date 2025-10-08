import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/notifier_provider/counter_notifier.dart';

class NotiferP extends ConsumerWidget {
  const NotiferP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Notifier Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString(), style: TextStyle(fontSize: 40)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterNotifierProvider.notifier).increment();
                },
                child: Text("+", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(width: 16),

              ElevatedButton(
                onPressed: () {
                  ref.read(counterNotifierProvider.notifier).decrement();
                },
                child: Text("-", style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
