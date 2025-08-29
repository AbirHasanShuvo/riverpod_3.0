import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//creating a counter provier which is so good

final counterProvider = StateProvider((Ref ref) {
  return 0;
});

class StateProviderTutorial extends ConsumerWidget {
  const StateProviderTutorial({super.key});

  //so from the above build method there is always calling build
  //method which is not a good practice

  //in the below the specific widget will be updated

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //build method is loaded
    print('build method loaded');
    return Scaffold(
      appBar: AppBar(title: Text('State Provider Tutorial')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //just need to change here you don't need to
          //call whole function and receiving data like
          //this
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final counter = ref.watch(counterProvider);

          print('Consumer method loaded');

          return Center(
            child: Text(counter.toString(), style: TextStyle(fontSize: 40)),
          );
        },
      ),
    );
  }
}
