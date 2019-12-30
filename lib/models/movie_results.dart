import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:disfilm/dtos/movie_results_dto.dart';
import 'package:disfilm/models/models_utils.dart';
import 'package:disfilm/models/movie.dart';

part 'movie_results.g.dart';

abstract class MovieResults
    implements Built<MovieResults, MovieResultsBuilder> {
  factory MovieResults([Function(MovieResultsBuilder b) updates]) =
      _$MovieResults;

  factory MovieResults.fromDto(MovieResultsDto dto) {
    return MovieResults(
      (b) => b
        ..page = dto.page
        ..results = toListBuilder<Movie>(
          dto.results?.map((m) => Movie.fromDto(m)),
        )
        ..totalResults = dto.totalResults
        ..totalPages = dto.totalPages,
    );
  }

  MovieResults._();

  @nullable
  int get page;

  @nullable
  BuiltList<Movie> get results;

  @nullable
  int get totalResults;

  @nullable
  int get totalPages;
}
