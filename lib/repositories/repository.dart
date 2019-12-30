import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class Repository {
  const Repository({@required this.appConfig}) : assert(appConfig != null);

  final AppConfig appConfig;

  String buildUrl({
    @required String endpoint,
    @required Map<String, dynamic> params,
  }) {
    assert(endpoint != null && endpoint.isNotEmpty);

    final filteredParamsToString = <String, String>{
      for (final String key in params.keys)
        if (params[key] != null && '${params[key]}'.isNotEmpty)
          key: '${params[key]}'
    };

    filteredParamsToString['api_key'] = appConfig.apiKey;

    final Uri uri = Uri(
      scheme: appConfig.urlScheme,
      host: appConfig.urlHost,
      port: null,
      path: "${appConfig.urlPath}$endpoint",
      queryParameters: filteredParamsToString,
    );

    return uri.toString();
  }

  Either<Failure, T> mapResponse<T>({
    @required http.Response response,
    @required T Function(String body) mapper,
  }) {
    assert(response != null);
    assert(mapper != null);

    if (response.statusCode == HttpStatus.ok) {
      return Right<Failure, T>(mapper(response.body));
    } else {
      return Left<Failure, T>(ApiFailure(response.body));
    }
  }
}
