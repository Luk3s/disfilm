import 'package:recase/recase.dart';

enum SortBy {
  popularity,
  releaseDate,
  revenue,
  primaryReleaseDate,
  originalTitle,
  voteAverage,
  voteCount
}

enum SortOrder { asc, desc }

String sortByToString({SortBy sortBy, SortOrder sortOrder}) {
  if (sortBy != null) {
    sortOrder ??= SortOrder.desc;

    final sortByToString = '$sortBy'.split('.').last;
    final sortOrderToString = '$sortOrder'.split('.').last;

    return '${ReCase(sortByToString).snakeCase}.$sortOrderToString';
  }

  return null;
}
