import 'package:disfilm/repositories/sort_by.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$sortByToString', () {
    test(
      'it should correctly convert different $SortBy',
      () {
        expect(
          sortByToString(sortBy: SortBy.popularity),
          'popularity.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.releaseDate),
          'release_date.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.revenue),
          'revenue.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.primaryReleaseDate),
          'primary_release_date.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.originalTitle),
          'original_title.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.voteAverage),
          'vote_average.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.voteCount),
          'vote_count.desc',
        );
      },
    );

    test(
      'it should use ${SortOrder.desc} if order is not specified',
      () {
        expect(sortByToString(sortBy: SortBy.releaseDate), 'release_date.desc');

        expect(
          sortByToString(sortBy: SortBy.releaseDate, sortOrder: SortOrder.desc),
          'release_date.desc',
        );

        expect(
          sortByToString(sortBy: SortBy.releaseDate, sortOrder: SortOrder.asc),
          'release_date.asc',
        );
      },
    );

    test(
      'it should return null if $SortBy is not specified',
      () {
        expect(sortByToString(), null);
      },
    );
  });
}
