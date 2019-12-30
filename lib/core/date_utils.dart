import 'package:intl/intl.dart';

final _fullDate = DateFormat("dd MMMM yyyy");
final _americanDate = DateFormat("yyyy-MM-dd");

String toFullDate(DateTime date) {
  if (date != null) {
    // To avoid dealing with time zones
    final utcDate = DateTime.utc(date.year, date.month, date.day, 12);

    return _fullDate.format(utcDate);
  }

  return null;
}

String toAmericanDate(DateTime date) {
  if (date != null) {
    // To avoid dealing with time zones
    final utcDate = DateTime.utc(date.year, date.month, date.day, 12);

    return _americanDate.format(utcDate);
  }

  return null;
}
