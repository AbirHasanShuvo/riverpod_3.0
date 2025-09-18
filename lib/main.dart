import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_7/todo_example/todo_screen.dart';
import 'package:riverpod_v3/section_2/video_8/async_notifier_screen.dart';
import 'package:riverpod_v3/section_3/video_10/computed_screens.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SomeScreen()),
    ),
  );
}
