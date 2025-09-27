import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/theme_provider/theme_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Theme')),
      body: Center(
        child: Switch(
          value: isLightTheme,
          onChanged: (value) => ref.read(themeProvider.notifier).state = value,
        ),
      ),
    );
  }
}
