import 'package:built_collection/built_collection.dart';
import 'package:disfilm/repositories/query_params_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$listToString', () {
    test('should return null if the list passed is null', () {
      expect(listToString(null), null);
    });

    test('should return the list as a comma separated String', () {
      expect(
        listToString(BuiltList<int>(<int>[11, 13, 15])),
        '11,13,15',
      );
    });
  });
}
