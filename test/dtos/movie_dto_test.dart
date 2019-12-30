import 'dart:convert';

import 'package:disfilm/dtos/dto_serializers.dart';
import 'package:disfilm/dtos/movie_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_resources/fixtures/movies/movie_fixtures.dart';
import '../test_resources/presets/p_movie_dto.dart';

void main() {
  group('$MovieDto', () {
    test('it should create DTO from JSON', () {
      final MovieDto movieDto = serializers.deserializeWith(
        MovieDto.serializer,
        json.decode(MovieFixtures.nightmareBeforeChristmas),
      );

      expect(movieDto, PMovieDto.theNightmareBeforeChristmas());
    });
  });
}
