import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:disfilm/change_notifiers/movie_chart_change_notifier.dart';
import 'package:disfilm/core/failure.dart';
import 'package:disfilm/core/keyword.dart';
import 'package:disfilm/core/status.dart';
import 'package:disfilm/models/movie.dart';
import 'package:disfilm/models/movie_results.dart';
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_resources/mocks.dart';
import '../test_resources/presets/p_movie_results.dart';

void main() {
  group('$MovieChartChangeNotifier', () {
    DiscoverRepository discoverRepository;

    setUp(() {
      discoverRepository = MockDiscoverRepository();
    });

    test(
      'should throw an AssertionError if $DiscoverRepository is null',
      () {
        expect(
          () => MovieChartChangeNotifier(discoverRepository: null),
          throwsAssertionError,
        );

        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Left<Failure, MovieResults>(MockFailure()),
        );

        expect(
          () => MovieChartChangeNotifier(
            discoverRepository: discoverRepository,
          ),
          returnsNormally,
        );
      },
    );

    test(
      'should request page 1 on creation',
      () {
        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Left<Failure, MovieResults>(MockFailure()),
        );

        MovieChartChangeNotifier(discoverRepository: discoverRepository);
        verify(discoverRepository.movies(page: 1));
      },
    );

    test(
      'should request page 1 when keyword has changed',
      () {
        when(discoverRepository.movies(
          page: 1,
          withKeywords: anyNamed('withKeywords'),
        )).thenAnswer((_) async => Left<Failure, MovieResults>(MockFailure()));

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        movieChangeNotifier.withKeyword(Keyword.christmas());

        verify(discoverRepository.movies(
          page: 1,
          withKeywords: BuiltList<int>(<int>[Keyword.christmas().value]),
        ));
      },
    );

    test(
      'should request next page',
      () async {
        when(discoverRepository.movies(page: anyNamed('page'))).thenAnswer(
          (_) async => Right<Failure, MovieResults>(
            PMovieResults.topRatedChristmasFilmsPageOne(),
          ),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );
        verify(discoverRepository.movies(page: 1));

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        await movieChangeNotifier.loadNextPage();
        verify(discoverRepository.movies(page: 2));
      },
    );

    test(
      'should not request next page if repository returns a $Failure',
      () async {
        when(discoverRepository.movies(page: anyNamed('page'))).thenAnswer(
          (_) async => Left<Failure, MovieResults>(MockFailure()),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );
        verify(discoverRepository.movies(page: 1));

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        await movieChangeNotifier.loadNextPage();
        verify(discoverRepository.movies(page: 1));
        verifyNever(discoverRepository.movies(page: 2));
      },
    );

    test(
      'should notify listeners when the status changes (SUCCESS)',
      () async {
        when(discoverRepository.movies(page: anyNamed('page'))).thenAnswer(
          (_) async => Right<Failure, MovieResults>(
            PMovieResults.topRatedChristmasFilmsPageOne(),
          ),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        final List<Status> log = <Status>[];
        void listener() => log.add(movieChangeNotifier.status);

        movieChangeNotifier.addListener(listener);

        await movieChangeNotifier.loadNextPage();

        expect(log, <Status>[Status.LOADING, Status.SUCCESS]);
      },
    );

    test(
      'should notify listeners when the status changes (ERROR)',
      () async {
        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(
            PMovieResults.topRatedChristmasFilmsPageOne(),
          ),
        );
        when(discoverRepository.movies(page: 2)).thenAnswer(
          (_) async => Left<Failure, MovieResults>(MockFailure()),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        final List<Status> log = <Status>[];
        void listener() => log.add(movieChangeNotifier.status);

        movieChangeNotifier.addListener(listener);

        await movieChangeNotifier.loadNextPage();

        expect(log, <Status>[Status.LOADING, Status.ERROR]);
      },
    );

    test(
      'should update movies when loading new pages',
      () async {
        final pages = PMovieResults.tenFilmsThreePagesFourPerPage();

        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[0]),
        );

        when(discoverRepository.movies(page: 2)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[1]),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        expect(movieChangeNotifier.movies, pages[0].results);

        await movieChangeNotifier.loadNextPage();

        final firstTwoPages = BuiltList<Movie>(
          pages[0].results.toList()..addAll(pages[1].results),
        );
        expect(movieChangeNotifier.movies, firstTwoPages);
      },
    );

    test(
      'should not load next page if status is ${Status.LOADING}',
      () async {
        final pages = PMovieResults.tenFilmsThreePagesFourPerPage();

        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[0]),
        );

        when(discoverRepository.movies(page: 2)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[1]),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        expect(movieChangeNotifier.movies, pages[0].results);

        // ignore: unawaited_futures
        movieChangeNotifier.loadNextPage();
        // ignore: unawaited_futures
        movieChangeNotifier.loadNextPage();
        // ignore: unawaited_futures
        movieChangeNotifier.loadNextPage();

        verify(discoverRepository.movies(page: 1)).called(1);
        verify(discoverRepository.movies(page: 2)).called(1);
        verifyNever(discoverRepository.movies(page: 3));
      },
    );

    test(
      'should not load next page there are no more pages to load',
      () async {
        final pages = PMovieResults.tenFilmsThreePagesFourPerPage();

        when(discoverRepository.movies(page: 1)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[0]),
        );

        when(discoverRepository.movies(page: 2)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[1]),
        );

        when(discoverRepository.movies(page: 3)).thenAnswer(
          (_) async => Right<Failure, MovieResults>(pages[2]),
        );

        final movieChangeNotifier = MovieChartChangeNotifier(
          discoverRepository: discoverRepository,
        );

        // Waiting for the future in the constructor to be executed
        await Future<void>.delayed(const Duration(milliseconds: 1));

        expect(movieChangeNotifier.movies, pages[0].results);

        await movieChangeNotifier.loadNextPage();
        await movieChangeNotifier.loadNextPage();
        await movieChangeNotifier.loadNextPage();
        await movieChangeNotifier.loadNextPage();
        await movieChangeNotifier.loadNextPage();

        verify(discoverRepository.movies(page: 1)).called(1);
        verify(discoverRepository.movies(page: 2)).called(1);
        verify(discoverRepository.movies(page: 3)).called(1);
        verifyNever(discoverRepository.movies(page: 4));
      },
    );
  });
}
