import 'package:disfilm/dtos/movie_dto.dart';
import 'package:disfilm/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_resources/presets/p_movie.dart';
import '../test_resources/presets/p_movie_dto.dart';

void main() {
  group('$Movie', () {
    test('should correctly create a $Movie instance from $MovieDto', () {
      expect(
        Movie.fromDto(PMovieDto.theNightmareBeforeChristmas()),
        PMovie.theNightmareBeforeChristmas(),
      );
    });
  });
}
