import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/change_notifiers/movie_chart_change_notifier.dart';
import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/dependency_squirrel.dart' as ds;
import 'package:disfilm/core/status.dart';
import 'package:disfilm/widgets/movie_list/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../keyword_indicator.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({
    @required this.popularMoviesChangeNotifier,
    @required this.keywordChangeNotifier,
    Key key,
  }) : super(key: key);

  static const String routeName = '/popular-movies';

  final PopularMoviesChangeNotifier popularMoviesChangeNotifier;
  final KeywordChangeNotifier keywordChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return _MovieListScreen<PopularMoviesChangeNotifier>(
      movieChartChangeNotifier: popularMoviesChangeNotifier,
      keywordChangeNotifier: keywordChangeNotifier,
      title: 'Popular Movies',
    );
  }
}

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({
    @required this.topRatedMoviesChangeNotifier,
    @required this.keywordChangeNotifier,
    Key key,
  }) : super(key: key);

  static const String routeName = '/top-rated-movies';

  final TopRatedMoviesChangeNotifier topRatedMoviesChangeNotifier;
  final KeywordChangeNotifier keywordChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return _MovieListScreen<TopRatedMoviesChangeNotifier>(
      movieChartChangeNotifier: topRatedMoviesChangeNotifier,
      keywordChangeNotifier: keywordChangeNotifier,
      title: 'Top Rated Movies',
    );
  }
}

class UpcomingMoviesScreen extends StatelessWidget {
  const UpcomingMoviesScreen({
    @required this.upcomingMoviesChangeNotifier,
    @required this.keywordChangeNotifier,
    Key key,
  }) : super(key: key);

  static const String routeName = '/upcoming-movies';

  final UpcomingMoviesChangeNotifier upcomingMoviesChangeNotifier;
  final KeywordChangeNotifier keywordChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return _MovieListScreen<UpcomingMoviesChangeNotifier>(
      movieChartChangeNotifier: upcomingMoviesChangeNotifier,
      keywordChangeNotifier: keywordChangeNotifier,
      title: 'Upcoming Movies',
    );
  }
}

class _MovieListScreen<T extends MovieChartChangeNotifier>
    extends StatefulWidget {
  const _MovieListScreen({
    @required this.movieChartChangeNotifier,
    @required this.keywordChangeNotifier,
    @required this.title,
    Key key,
  })  : assert(movieChartChangeNotifier != null),
        assert(keywordChangeNotifier != null),
        assert(title != null),
        super(key: key);

  final T movieChartChangeNotifier;
  final KeywordChangeNotifier keywordChangeNotifier;
  final String title;

  @override
  __MovieListScreenState createState() => __MovieListScreenState<T>();
}

class __MovieListScreenState<T> extends State<_MovieListScreen> {
  @override
  void initState() {
    super.initState();
    widget.keywordChangeNotifier.addListener(_onKeywordChanged);
  }

  void _onKeywordChanged() {
    widget.movieChartChangeNotifier.withKeyword(
      widget.keywordChangeNotifier.keyword,
    );
  }

  @override
  void dispose() {
    widget.keywordChangeNotifier.removeListener(_onKeywordChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ds.listen<T>(builder: (context) {
      if (widget.movieChartChangeNotifier.movies.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            elevation: 0,
            actions: <Widget>[
              KeywordIndicator(
                keywordChangeNotifier: widget.keywordChangeNotifier,
              )
            ],
          ),
          body: _emptyListBuilder(),
        );
      } else {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(widget.title),
                forceElevated: false,
                pinned: true,
                actions: <Widget>[
                  KeywordIndicator(
                    keywordChangeNotifier: widget.keywordChangeNotifier,
                  )
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    _movieBuilder,
                    childCount:
                        widget.movieChartChangeNotifier.movies.length + 1,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  Widget _movieBuilder(BuildContext context, int index) {
    if (widget.movieChartChangeNotifier.movies.isEmpty) {
      return _emptyListBuilder();
    }

    if (index == widget.movieChartChangeNotifier.movies.length) {
      return _endOfListBuilder();
    }

    if (widget.movieChartChangeNotifier.shouldLoadNextPage(index)) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => widget.movieChartChangeNotifier.loadNextPage(),
      );
    }

    return MovieCard(
      appConfig: ds.find<AppConfig>(context),
      movie: widget.movieChartChangeNotifier.movies[index],
    );
  }

  Widget _loadingWidget() {
    return SpinKitChasingDots(color: Colors.white);
  }

  Widget _emptyListBuilder() {
    switch (widget.movieChartChangeNotifier.status) {
      case Status.SUCCESS:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.film, color: Colors.white, size: 64),
              SizedBox(height: 20),
              Text(
                "Nothing to display",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      case Status.LOADING:
        return _loadingWidget();
      case Status.ERROR:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.white,
                size: 64,
              ),
              SizedBox(height: 20),
              Text(
                widget.movieChartChangeNotifier.failureMessage,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
    }

    throw '${widget.movieChartChangeNotifier.status} not recognised';
  }

  Widget _endOfListBuilder() {
    if (!widget.movieChartChangeNotifier.hasMore) {
      return SizedBox();
    }

    switch (widget.movieChartChangeNotifier.status) {
      case Status.SUCCESS:
      case Status.LOADING:
        return Padding(
          padding: const EdgeInsets.all(32),
          child: _loadingWidget(),
        );
      case Status.ERROR:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(height: 8),
              Text(
                "Cannot load more content...",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
    }

    throw '${widget.movieChartChangeNotifier.status} not recognised';
  }
}
