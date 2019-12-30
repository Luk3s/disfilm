import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:disfilm/dtos/movie_dto.dart';
import 'package:disfilm/models/models_utils.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;

  factory Movie.fromDto(MovieDto dto) {
    return Movie(
      (b) => b
        ..adult = dto.adult
        ..backdropPath = dto.backdropPath
        ..genreIds = toListBuilder<int>(dto.genreIds)
        ..id = dto.id
        ..originalLanguage = dto.originalLanguage
        ..originalTitle = dto.originalTitle
        ..overview = dto.overview
        ..posterPath = dto.posterPath
        ..releaseDate = toDateTime(dto.releaseDate)
        ..title = dto.title
        ..video = dto.video
        ..voteCount = dto.voteCount
        ..voteAverage = dto.voteAverage
        ..popularity = dto.popularity,
    );
  }

  Movie._();

  @nullable
  bool get adult;

  @nullable
  String get backdropPath;

  @nullable
  BuiltList<int> get genreIds;

  @nullable
  int get id;

  @nullable
  String get originalLanguage;

  @nullable
  String get originalTitle;

  @nullable
  String get overview;

  @nullable
  double get popularity;

  @nullable
  String get posterPath;

  @nullable
  DateTime get releaseDate;

  @nullable
  String get title;

  @nullable
  bool get video;

  @nullable
  int get voteCount;

  @nullable
  double get voteAverage;

  double get userRating => voteAverage * 10;
}
