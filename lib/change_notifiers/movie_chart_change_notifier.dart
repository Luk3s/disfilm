import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:disfilm/core/failure.dart';
import 'package:disfilm/core/keyword.dart';
import 'package:disfilm/core/status.dart';
import 'package:disfilm/models/movie.dart';
import 'package:disfilm/models/movie_results.dart';
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:disfilm/repositories/sort_by.dart';
import 'package:flutter/foundation.dart';

class PopularMoviesChangeNotifier extends MovieChartChangeNotifier {
  PopularMoviesChangeNotifier({
    @required DiscoverRepository discoverRepository,
    Keyword withKeyword,
  }) : super(
          discoverRepository: discoverRepository,
          sortBy: SortBy.popularity,
          withKeyword: withKeyword,
        );
}

class TopRatedMoviesChangeNotifier extends MovieChartChangeNotifier {
  TopRatedMoviesChangeNotifier({
    @required DiscoverRepository discoverRepository,
    Keyword withKeyword,
  }) : super(
          discoverRepository: discoverRepository,
          voteCountGte: 150,
          withoutGenres: BuiltList<int>(<int>[99, 10755]),
          sortBy: SortBy.voteAverage,
          withKeyword: withKeyword,
        );
}

class UpcomingMoviesChangeNotifier extends MovieChartChangeNotifier {
  UpcomingMoviesChangeNotifier({
    @required DiscoverRepository discoverRepository,
    Keyword withKeyword,
  }) : super(
          discoverRepository: discoverRepository,
          withReleaseType: BuiltList<String>(<String>['3']),
          releaseDateGte: DateTime.now().add(const Duration(days: 1)),
          releaseDateLte: DateTime.now().add(const Duration(days: 21)),
          sortBy: SortBy.popularity,
          withKeyword: withKeyword,
        );
}

class MovieChartChangeNotifier with ChangeNotifier {
  MovieChartChangeNotifier({
    @required this.discoverRepository,
    this.prefetchCount = 3,
    this.voteCountGte,
    this.withReleaseType,
    this.releaseDateGte,
    this.releaseDateLte,
    this.withoutGenres,
    this.sortBy = SortBy.popularity,
    Keyword withKeyword,
  }) : assert(discoverRepository != null) {
    _resetState(withKeyword);
    _performSearch();
  }

  final DiscoverRepository discoverRepository;
  final int prefetchCount;
  final double voteCountGte;
  final BuiltList<String> withReleaseType;
  final DateTime releaseDateGte;
  final DateTime releaseDateLte;
  final BuiltList<int> withoutGenres;
  final SortBy sortBy;

  int _pageToLoad;
  bool _hasMore;
  Keyword _withKeyword;
  BuiltList<Movie> _movies;
  Status _status;
  String _failureMessage;

  Status get status => _status;

  BuiltList<Movie> get movies => _movies;

  bool get hasMore => _hasMore;

  String get failureMessage => _failureMessage;

  void _resetState(Keyword keyword) {
    _pageToLoad = 1;
    _hasMore = true;
    _withKeyword = keyword;
    _movies = BuiltList<Movie>();
    _status = Status.SUCCESS;
    _failureMessage = '';
  }

  Future<void> withKeyword(Keyword keyword) async {
    if (keyword != _withKeyword) {
      _resetState(keyword);
      await _performSearch();
    }
  }

  bool shouldLoadNextPage(int indexBeingBuilt) {
    return status != Status.LOADING &&
        _hasMore &&
        _movies.isNotEmpty &&
        indexBeingBuilt == _movies.length - prefetchCount;
  }

  Future<void> loadNextPage() async {
    if (_status != Status.LOADING && _hasMore) {
      if (status != Status.ERROR) {
        _pageToLoad++;
      }
      await _performSearch();
    }
  }

  Future<void> _performSearch() async {
    _failureMessage = '';
    _status = Status.LOADING;
    notifyListeners();

    final Either<Failure, MovieResults> response =
        await discoverRepository.movies(
      page: _pageToLoad,
      voteCountGte: voteCountGte,
      withReleaseType: withReleaseType,
      releaseDateGte: releaseDateGte,
      releaseDateLte: releaseDateLte,
      withoutGenres: withoutGenres,
      withKeywords: _withKeyword != null
          ? BuiltList<int>(<int>[_withKeyword.value])
          : null,
      sortBy: sortBy,
      sortOrder: SortOrder.desc,
    );

    response.fold<void>(
      (failure) {
        _status = Status.ERROR;
        _failureMessage = failure.message;
        notifyListeners();
      },
      (movieResults) {
        _status = Status.SUCCESS;
        _hasMore = movieResults.page < movieResults.totalPages;
        _movies = BuiltList(_movies.toList()..addAll(movieResults.results));
        notifyListeners();
      },
    );
  }
}
