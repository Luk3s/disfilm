// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Movie extends Movie {
  @override
  final bool adult;
  @override
  final String backdropPath;
  @override
  final BuiltList<int> genreIds;
  @override
  final int id;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final DateTime releaseDate;
  @override
  final String title;
  @override
  final bool video;
  @override
  final int voteCount;
  @override
  final double voteAverage;

  factory _$Movie([void Function(MovieBuilder) updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteCount,
      this.voteAverage})
      : super._();

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        genreIds == other.genreIds &&
        id == other.id &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate &&
        title == other.title &&
        video == other.video &&
        voteCount == other.voteCount &&
        voteAverage == other.voteAverage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, adult.hashCode),
                                                        backdropPath.hashCode),
                                                    genreIds.hashCode),
                                                id.hashCode),
                                            originalLanguage.hashCode),
                                        originalTitle.hashCode),
                                    overview.hashCode),
                                popularity.hashCode),
                            posterPath.hashCode),
                        releaseDate.hashCode),
                    title.hashCode),
                video.hashCode),
            voteCount.hashCode),
        voteAverage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('adult', adult)
          ..add('backdropPath', backdropPath)
          ..add('genreIds', genreIds)
          ..add('id', id)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('releaseDate', releaseDate)
          ..add('title', title)
          ..add('video', video)
          ..add('voteCount', voteCount)
          ..add('voteAverage', voteAverage))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  DateTime _releaseDate;
  DateTime get releaseDate => _$this._releaseDate;
  set releaseDate(DateTime releaseDate) => _$this._releaseDate = releaseDate;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _adult = _$v.adult;
      _backdropPath = _$v.backdropPath;
      _genreIds = _$v.genreIds?.toBuilder();
      _id = _$v.id;
      _originalLanguage = _$v.originalLanguage;
      _originalTitle = _$v.originalTitle;
      _overview = _$v.overview;
      _popularity = _$v.popularity;
      _posterPath = _$v.posterPath;
      _releaseDate = _$v.releaseDate;
      _title = _$v.title;
      _video = _$v.video;
      _voteCount = _$v.voteCount;
      _voteAverage = _$v.voteAverage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              adult: adult,
              backdropPath: backdropPath,
              genreIds: _genreIds?.build(),
              id: id,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              posterPath: posterPath,
              releaseDate: releaseDate,
              title: title,
              video: video,
              voteCount: voteCount,
              voteAverage: voteAverage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
