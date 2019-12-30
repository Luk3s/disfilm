import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/core/assets.dart' as assets;
import 'package:disfilm/core/dependency_squirrel.dart' as ds;
import 'package:disfilm/widgets/home_page/chart_card.dart';
import 'package:disfilm/widgets/keyword_indicator.dart';
import 'package:disfilm/widgets/movie_list/movie_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('DisFilm'),
            forceElevated: false,
            pinned: true,
            actions: <Widget>[
              KeywordIndicator(
                keywordChangeNotifier: ds.find<KeywordChangeNotifier>(context),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                ChartCard(
                  label: 'Popular',
                  coverImagePath: assets.popularCoverImage,
                  onTap: () => Navigator.pushNamed<void>(
                    context,
                    PopularMoviesScreen.routeName,
                  ),
                ),
                ChartCard(
                  label: 'Top Rated',
                  coverImagePath: assets.topRatedCoverImage,
                  onTap: () => Navigator.pushNamed<void>(
                    context,
                    TopRatedMoviesScreen.routeName,
                  ),
                ),
                ChartCard(
                  label: 'Upcoming',
                  coverImagePath: assets.upcomingCoverImage,
                  onTap: () => Navigator.pushNamed<void>(
                    context,
                    UpcomingMoviesScreen.routeName,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
