import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dartz/dartz.dart';
import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/date_utils.dart' as dates;
import 'package:disfilm/core/failure.dart';
import 'package:disfilm/dtos/dto_serializers.dart';
import 'package:disfilm/dtos/movie_results_dto.dart';
import 'package:disfilm/models/movie_results.dart';
import 'package:disfilm/repositories/query_params_utils.dart';
import 'package:disfilm/repositories/repository.dart';
import 'package:disfilm/repositories/sort_by.dart';
import 'package:flutter/foundation.dart';
import 'package:http/src/client.dart';
import 'package:http/src/response.dart';

class DiscoverRepository extends Repository {
  const DiscoverRepository({
    @required this.httpClient,
    @required AppConfig appConfig,
  })  : assert(httpClient != null),
        super(appConfig: appConfig);

  final Client httpClient;

  Future<Either<Failure, MovieResults>> movies({
    @required int page,
    double voteCountGte,
    BuiltList<String> withReleaseType,
    DateTime releaseDateGte,
    DateTime releaseDateLte,
    BuiltList<int> withoutGenres,
    BuiltList<int> withKeywords,
    SortBy sortBy = SortBy.popularity,
    SortOrder sortOrder = SortOrder.desc,
    bool includeAdult = false,
    bool includeVideo = false,
  }) async {
    final sortByParameter = sortByToString(
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    final String url = buildUrl(
      endpoint: '/discover/movie',
      params: <String, dynamic>{
        "page": page,
        "region": super.appConfig.region,
        "vote_count.gte": voteCountGte,
        "with_release_type": listToString(withReleaseType),
        "release_date.gte": dates.toAmericanDate(releaseDateGte),
        "release_date.lte": dates.toAmericanDate(releaseDateLte),
        "without_genres": listToString(withoutGenres),
        "with_keywords": listToString(withKeywords),
        "sort_by": sortByParameter,
        "include_adult": includeAdult,
        "include_video": includeVideo,
      },
    );

    Response response;
    try {
      response = await httpClient.get(url);
    } on Exception catch (_) {
      return Left<Failure, MovieResults>(NetworkFailure(response?.body));
    }

    return mapResponse<MovieResults>(
      response: response,
      mapper: (jsonBody) {
        final deserializedResponse = serializers.deserialize(
          json.decode(response.body),
          specifiedType: FullType(MovieResultsDto),
        );

        return MovieResults.fromDto(deserializedResponse as MovieResultsDto);
      },
    );
  }
}
