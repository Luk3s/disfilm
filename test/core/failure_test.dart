import 'package:disfilm/core/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$NetworkFailure', () {
    test(
      'toString() should return the class name if message is null or empty',
      () {
        final failureWithNoMessage = NetworkFailure();
        expect(failureWithNoMessage.toString(), '$NetworkFailure');

        final failureWithNullMessage = NetworkFailure(null);
        expect(failureWithNullMessage.toString(), '$NetworkFailure');

        final failureWithEmptyMessage = NetworkFailure('');
        expect(failureWithEmptyMessage.toString(), '$NetworkFailure');
      },
    );

    test(
      'toString() should return the class name with the message',
      () {
        final failureWithNoMessage = NetworkFailure('test');
        expect(failureWithNoMessage.toString(), '$NetworkFailure: test');
      },
    );
  });
}
