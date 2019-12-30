import 'package:built_collection/built_collection.dart';

ListBuilder<T> toListBuilder<T>(Iterable<T> iterable) {
  if (iterable == null) {
    return null;
  }

  return ListBuilder<T>(iterable);
}

DateTime toDateTime(String date) {
  if (date == null) {
    return null;
  }

  return DateTime.parse(date);
}
