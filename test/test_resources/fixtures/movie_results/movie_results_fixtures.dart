import 'package:path/path.dart' as p;

import '../../fixture_reader.dart';

class MovieResultsFixtures {
  MovieResultsFixtures._();

  static final String topRatedChristmasFilmsPageOne = fixture(
    p.join('movie_results', 'top_rated_christmas_films_page_one.json'),
  );
}
