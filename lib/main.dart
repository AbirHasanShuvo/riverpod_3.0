import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/new_series/riverpod_generator/gene_home.dart';
import 'package:riverpod_v3/new_series/theme_provider/theme_provider.dart';
import 'package:riverpod_v3/new_series/widget_rebuild/new_home.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello Black Titanium";
});

//state provider
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    //for the theme
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: GeneHome(),
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
    final count = ref.watch(counterProvider);

    //this is a great feature of riverpod

    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Your number is clicked')));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod printing'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterProvider);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          //another approach
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
