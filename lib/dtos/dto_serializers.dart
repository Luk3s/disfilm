import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/src/date_time_serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:disfilm/dtos/movie_dto.dart';
import 'package:disfilm/dtos/movie_results_dto.dart';

part 'dto_serializers.g.dart';

/// Add all of the built value types that require serialization
@SerializersFor([
  MovieDto,
  MovieResultsDto,
])

/// Serialization with generics requires manually adding builder
/// factories to serializers.
/// bug ref. https://github.com/google/built_value.dart/issues/124
///
/// Example:
///     For BuiltList<T> you need to add as many factories as the
///     classes you plan to use to substitute T
///
///     ..addBuilderFactory(
///        const FullType(BuiltList, [FullType(BuiltValueDtoClass)]),
///        () => ListBuilder<BuiltValueDtoClass>(),
///    )
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
