import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movie_dto.g.dart';

abstract class MovieDto implements Built<MovieDto, MovieDtoBuilder> {
  factory MovieDto([void Function(MovieDtoBuilder) updates]) = _$MovieDto;

  MovieDto._();

  static Serializer<MovieDto> get serializer => _$movieDtoSerializer;

  @nullable
  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @nullable
  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  @nullable
  @BuiltValueField(wireName: 'video')
  bool get video;

  @nullable
  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @nullable
  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;
}
