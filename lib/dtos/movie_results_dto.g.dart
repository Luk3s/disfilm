// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieResultsDto> _$movieResultsDtoSerializer =
    new _$MovieResultsDtoSerializer();

class _$MovieResultsDtoSerializer
    implements StructuredSerializer<MovieResultsDto> {
  @override
  final Iterable<Type> types = const [MovieResultsDto, _$MovieResultsDto];
  @override
  final String wireName = 'MovieResultsDto';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieResultsDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.page != null) {
      result
        ..add('page')
        ..add(serializers.serialize(object.page,
            specifiedType: const FullType(int)));
    }
    if (object.results != null) {
      result
        ..add('results')
        ..add(serializers.serialize(object.results,
            specifiedType:
                const FullType(BuiltList, const [const FullType(MovieDto)])));
    }
    if (object.totalResults != null) {
      result
        ..add('total_results')
        ..add(serializers.serialize(object.totalResults,
            specifiedType: const FullType(int)));
    }
    if (object.totalPages != null) {
      result
        ..add('total_pages')
        ..add(serializers.serialize(object.totalPages,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MovieResultsDto deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieResultsDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieDto)]))
              as BuiltList<dynamic>);
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieResultsDto extends MovieResultsDto {
  @override
  final int page;
  @override
  final BuiltList<MovieDto> results;
  @override
  final int totalResults;
  @override
  final int totalPages;

  factory _$MovieResultsDto([void Function(MovieResultsDtoBuilder) updates]) =>
      (new MovieResultsDtoBuilder()..update(updates)).build();

  _$MovieResultsDto._(
      {this.page, this.results, this.totalResults, this.totalPages})
      : super._();

  @override
  MovieResultsDto rebuild(void Function(MovieResultsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieResultsDtoBuilder toBuilder() =>
      new MovieResultsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieResultsDto &&
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
    return (newBuiltValueToStringHelper('MovieResultsDto')
          ..add('page', page)
          ..add('results', results)
          ..add('totalResults', totalResults)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class MovieResultsDtoBuilder
    implements Builder<MovieResultsDto, MovieResultsDtoBuilder> {
  _$MovieResultsDto _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<MovieDto> _results;
  ListBuilder<MovieDto> get results =>
      _$this._results ??= new ListBuilder<MovieDto>();
  set results(ListBuilder<MovieDto> results) => _$this._results = results;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  MovieResultsDtoBuilder();

  MovieResultsDtoBuilder get _$this {
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
  void replace(MovieResultsDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MovieResultsDto;
  }

  @override
  void update(void Function(MovieResultsDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieResultsDto build() {
    _$MovieResultsDto _$result;
    try {
      _$result = _$v ??
          new _$MovieResultsDto._(
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
            'MovieResultsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
