import 'package:disfilm/core/app_config.dart';
import 'package:disfilm/core/failure.dart';
import 'package:disfilm/repositories/discover_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockHttpResponse extends Mock implements http.Response {}

class MockAppConfig implements AppConfig {
  @override
  String get urlScheme => 'https';

  @override
  String get urlHost => 'test.url';

  @override
  String get urlPath => '/path';

  @override
  String get apiKey => 'test key';

  @override
  String get region => 'TEST';

  @override
  String get imageBaseUrl => 'image.test.url';
}

class MockFailure extends Failure {}

class MockDiscoverRepository extends Mock implements DiscoverRepository {}
