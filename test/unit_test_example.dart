import 'package:flutter_nt_ten/data/models/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter klasini methodlari uchun test:", () {
    test("Counter klasinining increment methodi uchun test:", () {
      Counter counter = Counter();

      counter.increment();
      counter.increment();

      expect(counter.value, 2);
    });

    test("Counter klasinining decrement methodi uchun test:", () {
      Counter counter = Counter();

      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
