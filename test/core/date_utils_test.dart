import 'package:disfilm/core/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$toAmericanDate', () {
    test('should return null if the date passed is null', () {
      expect(toAmericanDate(null), null);
    });

    test('should return a String in the format yyyy-mm-dd', () {
      expect(
        toAmericanDate(DateTime(2019, DateTime.may, 15)),
        '2019-05-15',
      );
    });
  });

  group('$toFullDate', () {
    test('should return null if the date passed is null', () {
      expect(toFullDate(null), null);
    });

    test('should return a String in the format dd MMMM yyyy', () {
      expect(
        toFullDate(DateTime(2019, DateTime.may, 15)),
        '15 May 2019',
      );
    });
  });
}
