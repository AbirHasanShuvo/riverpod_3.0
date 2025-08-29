import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
    ),
  );
}

final statiStringProvider = Provider((Ref ref) {
  return "Hello World";
});

final intProvider = Provider((Ref ref) {
  return 26;
});

final doubleProvider = Provider((Ref ref) {
  return 3.14159;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(statiStringProvider);
    final intString = ref.watch(intProvider);
    final doubleString = ref.watch(doubleProvider);
    //here there is two calling system
    //read call when the UI don;t need to upate, it will be
    //fix and call once when the build method is called
    //but the watch is so dynamic that it will update
    return Scaffold(
      body: Center(
        child: Text(result + intString.toString() + doubleString.toString()),
      ),
    );
  }
}
