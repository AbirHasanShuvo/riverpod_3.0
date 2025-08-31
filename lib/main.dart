import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_5/video_5.dart';
import 'package:riverpod_v3/section_2/video_6/video_6.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TimerScreen(),
      ),
    ),
  );
}
