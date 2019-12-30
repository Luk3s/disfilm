import 'package:path/path.dart' as p;

import '../../fixture_reader.dart';

class MovieFixtures {
  MovieFixtures._();

  static final String nightmareBeforeChristmas = fixture(
    p.join('movies', 'nightmare_before_christmas.json'),
  );
}
