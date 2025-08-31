import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v3/section_2/video_6/fake_stream_service.dart';

// final tickerProvider = StreamProvider((_) {
//   return Stream.periodic(Duration(seconds: 1), (count) => count);
// });

final tickerProvider = StreamProvider((Ref ref) {
  final service = ref.read(timerService);
  // return service.tick();
  return service.tickWithError();
});

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickAsync = ref.watch(tickerProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Live Timer')),
      body: Center(
        child: tickAsync.when(
          skipLoadingOnRefresh: false,
          data: (count) =>
              Text('Second elapsed : $count', style: TextStyle(fontSize: 32)),
          error: (e, stackTrace) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error : $e', style: TextStyle(color: Colors.red)),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.refresh(tickerProvider),
                child: Text('Retry'),
              ),
            ],
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
