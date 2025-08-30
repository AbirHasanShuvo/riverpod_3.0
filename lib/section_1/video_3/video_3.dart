import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Creating provider
final textProvider = StateProvider<String>((ref) => '');

class StateFulConsumerTutorial extends ConsumerStatefulWidget {
  const StateFulConsumerTutorial({super.key});

  @override
  ConsumerState<StateFulConsumerTutorial> createState() =>
      _StateFulConsumerTutorialState();
}

class _StateFulConsumerTutorialState
    extends ConsumerState<StateFulConsumerTutorial> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Text Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(controller: _controller),
            const SizedBox(height: 20),
            Text('You Typed : $text'),
          ],
        ),
      ),
    );
  }
}
