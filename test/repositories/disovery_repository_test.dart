import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/failure.dart';
import 'package:disfilm/models/movie_results.dart';
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:disfilm/repositories/sort_by.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../test_resources/fixtures/api_failures/api_failures_fixtures.dart';
import '../test_resources/fixtures/movie_results/movie_results_fixtures.dart';
import '../test_resources/mocks.dart';
import '../test_resources/presets/p_movie_results.dart';

void main() {
  group('$DiscoverRepository', () {
    http.Client httpClient;
    http.Response httpResponse;
    AppConfig appConfig;

    DiscoverRepository discoverRepository;

    setUp(() {
      httpClient = MockHttpClient();
      httpResponse = MockHttpResponse();
      appConfig = MockAppConfig();

      discoverRepository = DiscoverRepository(
        httpClient: httpClient,
        appConfig: appConfig,
      );
    });

    test(
      'should return a $NetworkFailure when the client throws an exception',
      () async {
        when(httpClient.get(any)).thenThrow(HttpException('test message'));

        final Either<Failure, MovieResults> either =
            await discoverRepository.movies(page: 1);

        expect(either.isLeft(), true);
        expect((either as Left).value, isA<NetworkFailure>());
      },
    );

    test(
      'should return an $ApiFailure when the response is not ${HttpStatus.ok}',
      () async {
        when(httpClient.get(any)).thenAnswer((_) async => httpResponse);

        when(httpResponse.statusCode).thenReturn(HttpStatus.notFound);
        when(httpResponse.body).thenReturn(ApiFailuresFixtures.response404);

        final Either<Failure, MovieResults> either =
            await discoverRepository.movies(page: 1);

        expect(either.isLeft(), true);

        final left = either as Left<Failure, MovieResults>;

        expect(left.value, isA<ApiFailure>());
        expect(left.value.message, ApiFailuresFixtures.response404);
      },
    );

    test(
      'should send get request to correct url with default parameters',
      () async {
        when(httpClient.get(any)).thenAnswer((_) async => httpResponse);

        when(httpResponse.statusCode).thenReturn(HttpStatus.ok);
        when(httpResponse.body).thenReturn(
          MovieResultsFixtures.topRatedChristmasFilmsPageOne,
        );

        await discoverRepository.movies(page: 42);

        final url =
            '${appConfig.urlScheme}://${appConfig.urlHost}${appConfig.urlPath}/'
            'discover/movie?'
            'page=42'
            '&region=${appConfig.region}'
            '&sort_by=popularity.desc'
            '&include_adult=false'
            '&include_video=false'
            '&api_key=${Uri.encodeQueryComponent(appConfig.apiKey)}';

        verify(httpClient.get(url));
      },
    );

    test(
      'should send get request to correct url with given parameters',
      () async {
        when(httpClient.get(any)).thenAnswer((_) async => httpResponse);

        when(httpResponse.statusCode).thenReturn(HttpStatus.ok);
        when(httpResponse.body).thenReturn(
          MovieResultsFixtures.topRatedChristmasFilmsPageOne,
        );

        await discoverRepository.movies(
          page: 42,
          voteCountGte: 150,
          withReleaseType: BuiltList<String>(<String>['2|3']),
          releaseDateGte: DateTime(2019, DateTime.may, 15),
          releaseDateLte: DateTime(2019, DateTime.may, 30),
          withoutGenres: BuiltList<int>(<int>[99, 10755]),
          withKeywords: BuiltList<int>(<int>[207317]),
          sortBy: SortBy.primaryReleaseDate,
          sortOrder: SortOrder.asc,
          includeAdult: true,
          includeVideo: true,
        );

        final url =
            '${appConfig.urlScheme}://${appConfig.urlHost}${appConfig.urlPath}/'
            'discover/movie?'
            'page=42'
            '&region=${appConfig.region}'
            '&vote_count.gte=150.0'
            "&with_release_type=2%7C3"
            "&release_date.gte=2019-05-15"
            "&release_date.lte=2019-05-30"
            '&without_genres=99%2C10755'
            '&with_keywords=207317'
            '&sort_by=primary_release_date.asc'
            '&include_adult=true'
            '&include_video=true'
            '&api_key=${Uri.encodeQueryComponent(appConfig.apiKey)}';

        verify(httpClient.get(url));
      },
    );

    test(
      'should return deserialized $MovieResults on success',
      () async {
        when(httpClient.get(any)).thenAnswer((_) async => httpResponse);

        when(httpResponse.statusCode).thenReturn(HttpStatus.ok);
        when(httpResponse.body).thenReturn(
          MovieResultsFixtures.topRatedChristmasFilmsPageOne,
        );

        final Either<Failure, MovieResults> either =
            await discoverRepository.movies(page: 1);

        expect(either.isRight(), true);

        final right = either as Right<Failure, MovieResults>;

        expect(right.value, isA<MovieResults>());
        expect(right.value, PMovieResults.topRatedChristmasFilmsPageOne());
      },
    );
  });
}
