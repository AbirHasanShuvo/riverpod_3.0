import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_1/video_2/video_2.dart';
import 'package:riverpod_v3/section_1/video_3/video_3.dart';
import 'package:riverpod_v3/section_2/video_5/video_5.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GreetingScreen(),
      ),
    ),
  );
}
