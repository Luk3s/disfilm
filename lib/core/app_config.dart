import 'package:disfilm/core/api_key.dart' as secret;

class AppConfig {
  const AppConfig();

  String get urlScheme => 'https';

  String get urlHost => 'api.themoviedb.org';

  String get urlPath => '/3';

  String get apiKey => secret.apiKey;

  String get region => 'US';

  String get imageBaseUrl => 'https://image.tmdb.org/t/p/w780';
}
