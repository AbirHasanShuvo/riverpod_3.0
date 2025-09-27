import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'gene_home.g.dart';

// final nameProvider = Provider<String>((ref) => "Static Provider");

@Riverpod(keepAlive: true)
String name(NameRef ref) {
  return "Abir Hasan Shuvo";
}

class GeneHome extends ConsumerWidget {
  const GeneHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Generator')),
      body: Center(child: Text(name)),
    );
  }
}
