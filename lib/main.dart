import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/video_1/video_1.dart';
import 'package:riverpod_v3/video_2/video_2.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StateProviderTutorial(),
      ),
    ),
  );
}
