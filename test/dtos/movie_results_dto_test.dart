import 'dart:convert';

import 'package:disfilm/dtos/dto_serializers.dart';
import 'package:disfilm/dtos/movie_results_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_resources/fixtures/movie_results/movie_results_fixtures.dart';
import '../test_resources/presets/p_movie_results_dto.dart';

void main() {
  group('$MovieResultsDto()', () {
    test('it should create DTO from JSON', () {
      final MovieResultsDto results = serializers.deserializeWith(
        MovieResultsDto.serializer,
        json.decode(MovieResultsFixtures.topRatedChristmasFilmsPageOne),
      );

      expect(results, PMovieResultsDto.topRatedChristmasFilmsPageOne());
    });
  });
}
