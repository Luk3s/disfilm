import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:disfilm/dtos/movie_dto.dart';

part 'movie_results_dto.g.dart';

abstract class MovieResultsDto
    implements Built<MovieResultsDto, MovieResultsDtoBuilder> {
  factory MovieResultsDto([Function(MovieResultsDtoBuilder b) updates]) =
      _$MovieResultsDto;

  MovieResultsDto._();

  static Serializer<MovieResultsDto> get serializer =>
      _$movieResultsDtoSerializer;

  @nullable
  @BuiltValueField(wireName: 'page')
  int get page;

  @nullable
  @BuiltValueField(wireName: 'results')
  BuiltList<MovieDto> get results;

  @nullable
  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  @nullable
  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;
}
