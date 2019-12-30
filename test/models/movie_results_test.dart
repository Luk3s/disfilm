import 'package:disfilm/dtos/movie_results_dto.dart';
import 'package:disfilm/models/movie_results.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_resources/presets/p_movie_results.dart';
import '../test_resources/presets/p_movie_results_dto.dart';

void main() {
  group('$MovieResults', () {
    test(
        'should correctly create a $MovieResults instance from $MovieResultsDto',
        () {
      expect(
        MovieResults.fromDto(PMovieResultsDto.topRatedChristmasFilmsPageOne()),
        PMovieResults.topRatedChristmasFilmsPageOne(),
      );
    });
  });
}
