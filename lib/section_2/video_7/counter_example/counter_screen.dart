import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_provider_controller.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final ctrl = ref.read(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("Counter Notifier")),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ctrl.decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 12),
          FloatingActionButton(
            onPressed: ctrl.reset,
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 12),
          FloatingActionButton(
            onPressed: ctrl.increment,
            child: Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Center(child: Text("Count $count")),
    );
  }
}
