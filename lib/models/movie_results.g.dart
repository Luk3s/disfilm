// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MovieResults extends MovieResults {
  @override
  final int page;
  @override
  final BuiltList<Movie> results;
  @override
  final int totalResults;
  @override
  final int totalPages;

  factory _$MovieResults([void Function(MovieResultsBuilder) updates]) =>
      (new MovieResultsBuilder()..update(updates)).build();

  _$MovieResults._(
      {this.page, this.results, this.totalResults, this.totalPages})
      : super._();

  @override
  MovieResults rebuild(void Function(MovieResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieResultsBuilder toBuilder() => new MovieResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieResults &&
        page == other.page &&
        results == other.results &&
        totalResults == other.totalResults &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), results.hashCode),
            totalResults.hashCode),
        totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieResults')
          ..add('page', page)
          ..add('results', results)
          ..add('totalResults', totalResults)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class MovieResultsBuilder
    implements Builder<MovieResults, MovieResultsBuilder> {
  _$MovieResults _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<Movie> _results;
  ListBuilder<Movie> get results =>
      _$this._results ??= new ListBuilder<Movie>();
  set results(ListBuilder<Movie> results) => _$this._results = results;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  MovieResultsBuilder();

  MovieResultsBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _results = _$v.results?.toBuilder();
      _totalResults = _$v.totalResults;
      _totalPages = _$v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieResults other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MovieResults;
  }

  @override
  void update(void Function(MovieResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieResults build() {
    _$MovieResults _$result;
    try {
      _$result = _$v ??
          new _$MovieResults._(
              page: page,
              results: _results?.build(),
              totalResults: totalResults,
              totalPages: totalPages);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
