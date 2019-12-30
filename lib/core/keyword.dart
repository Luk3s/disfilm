import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Keyword {
  const Keyword.book()
      : value = 818,
        description = 'Based on a book';

  const Keyword.christmas()
      : value = 207317,
        description = 'Christmas';

  const Keyword.anime()
      : value = 210024,
        description = 'Anime';

  const Keyword.spy()
      : value = 9715,
        description = 'Spy';

  static final values = BuiltList<Keyword>(<Keyword>[
    Keyword.anime(),
    Keyword.book(),
    Keyword.christmas(),
    Keyword.spy(),
  ]);

  static final icons = BuiltMap<Keyword, IconData>(<Keyword, IconData>{
    Keyword.book(): FontAwesomeIcons.bookReader,
    Keyword.christmas(): FontAwesomeIcons.sleigh,
    Keyword.anime(): FontAwesomeIcons.toriiGate,
    Keyword.spy(): FontAwesomeIcons.userSecret,
  });

  final int value;

  final String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Keyword &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Keyword{value: $value, description: $description}';
  }
}
