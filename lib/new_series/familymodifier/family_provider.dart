import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//this is the provider when i can pass the value
final nameProvider = Provider.family<String, String>((ref, name) {
  return 'Hello, $name';
});

class FamilyProvider extends ConsumerStatefulWidget {
  const FamilyProvider({super.key});

  @override
  ConsumerState<FamilyProvider> createState() => _FamilyProviderState();
}

class _FamilyProviderState extends ConsumerState<FamilyProvider> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider('Md. Abir Hasan'));
    return Scaffold(body: Center(child: Text(name)));
  }
}
