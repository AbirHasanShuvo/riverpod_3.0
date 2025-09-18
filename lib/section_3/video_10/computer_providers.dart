import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<List<int>>((_) => [1, 2, 3, 4, 5]);

//derived state

final sumProvider = Provider<int>((Ref ref) {
  final list = ref.watch(numberProvider);

  return list.fold(0, (total, n) => total + n);
});
