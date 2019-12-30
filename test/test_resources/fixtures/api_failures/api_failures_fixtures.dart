import 'package:path/path.dart' as p;

import '../../fixture_reader.dart';

class ApiFailuresFixtures {
  ApiFailuresFixtures._();

  static final String response404 = fixture(
    p.join('api_failures', '404.json'),
  );

  static final String response401 = fixture(
    p.join('api_failures', '401.json'),
  );
}
