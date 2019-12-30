import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/change_notifiers/movie_chart_change_notifier.dart';
import 'package:disfilm/core/dependency_squirrel.dart' as ds;
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:disfilm/widgets/movie_list/movie_list_screen.dart';
import 'package:disfilm/widgets/route_not_found.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute({
  @required BuildContext context,
  @required RouteSettings settings,
}) {
  assert(context != null);
  assert(settings != null);

  switch (settings.name) {
    case PopularMoviesScreen.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) {
          final keywordChangeNotifier = ds.find<KeywordChangeNotifier>(context);

          return ds.insertNotifier<PopularMoviesChangeNotifier>(
            create: (_) => PopularMoviesChangeNotifier(
              discoverRepository: ds.find<DiscoverRepository>(context),
              withKeyword: keywordChangeNotifier.keyword,
            ),
            childBuilder: (_, notifier) => PopularMoviesScreen(
              popularMoviesChangeNotifier: notifier,
              keywordChangeNotifier: keywordChangeNotifier,
            ),
          );
        },
      );
    case TopRatedMoviesScreen.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) {
          final keywordChangeNotifier = ds.find<KeywordChangeNotifier>(context);

          return ds.insertNotifier<TopRatedMoviesChangeNotifier>(
            create: (_) => TopRatedMoviesChangeNotifier(
              discoverRepository: ds.find<DiscoverRepository>(context),
              withKeyword: keywordChangeNotifier.keyword,
            ),
            childBuilder: (_, notifier) => TopRatedMoviesScreen(
              topRatedMoviesChangeNotifier: notifier,
              keywordChangeNotifier: keywordChangeNotifier,
            ),
          );
        },
      );
    case UpcomingMoviesScreen.routeName:
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (_) {
          final keywordChangeNotifier = ds.find<KeywordChangeNotifier>(context);

          return ds.insertNotifier<UpcomingMoviesChangeNotifier>(
            create: (_) => UpcomingMoviesChangeNotifier(
              discoverRepository: ds.find<DiscoverRepository>(context),
              withKeyword: keywordChangeNotifier.keyword,
            ),
            childBuilder: (_, notifier) => UpcomingMoviesScreen(
              upcomingMoviesChangeNotifier: notifier,
              keywordChangeNotifier: keywordChangeNotifier,
            ),
          );
        },
      );
  }

  return MaterialPageRoute<void>(
    settings: settings,
    fullscreenDialog: true,
    builder: (_) => RouteNotFoundScreen(settings.name),
  );
}
