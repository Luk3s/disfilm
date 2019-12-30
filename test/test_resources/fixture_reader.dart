import 'dart:io';

import 'package:path/path.dart' as p;

String fixture(String pathToFile) {
  final testDirectory = Directory.current.path.endsWith('test')
      ? Directory.current.path
      : p.join(Directory.current.path, 'test');

  final path = p.join(
    testDirectory,
    'test_resources',
    'fixtures',
    pathToFile,
  );

  return File(path).readAsStringSync();
}
