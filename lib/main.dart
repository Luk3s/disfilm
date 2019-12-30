import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:disfilm/routing/router.dart' as router;
import 'package:disfilm/widgets/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> _initProviders() {
  // Private variables are values that are not provided to
  // the widget tree and  only used to set up other object
  // (i.e. should not be wrapped in Provider, everything else should)

  final _httpClient = http.Client();

  final appConfig = AppConfig();

  return [
    Provider.value(value: appConfig),
    Provider<DiscoverRepository>(
      create: (_) => DiscoverRepository(
        appConfig: appConfig,
        httpClient: _httpClient,
      ),
    ),
    ChangeNotifierProvider<KeywordChangeNotifier>(
      create: (_) => KeywordChangeNotifier(),
    ),
  ];
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discover Movies',
      theme: ThemeData(
        primaryColor: Color(0xFF36454F),
        primaryColorLight: Color(0xFF61707a),
        scaffoldBackgroundColor: Color(0xFF36454F),
        iconTheme: IconThemeData(color: Color(0xFF36454F)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF36454F),
        ),
      ),
      home: const HomeScreen(),
      onGenerateRoute: (settings) => router.onGenerateRoute(
        settings: settings,
        context: context,
      ),
    );
  }
}

void main() {
  final providers = _initProviders();

  runApp(MultiProvider(
    providers: providers,
    child: RootWidget(),
  ));
}
