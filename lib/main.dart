import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_7/todo_example/todo_screen.dart';
import 'package:riverpod_v3/section_2/video_8/async_notifier_screen.dart';
import 'package:riverpod_v3/section_3/video_10/computed_screens.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello Black Titanium";
});

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Main()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod return')),
      // body: Center(child: Text(name))
      //another method below
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Text(name);
          },
        ),
      ),
    );
  }
}

//new class

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  ConsumerState<Main> createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);

    return Scaffold(body: Center(child: Text(name)));
  }
}
