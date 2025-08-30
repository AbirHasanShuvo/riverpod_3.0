import 'dart:async';
import 'dart:math';

class FakeApiServices {
  Future<String> fetchGreetings() async {
    await Future.delayed(const Duration(seconds: 2));

    if (Random().nextDouble() < 0.5) {
      throw Exception("Hello from Fake API");
    } else {
      return "Hello from Async";
    }
  }
}
