import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/core/keyword.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$KeywordChangeNotifier', () {
    test(
      'should initialise keyword with the value passed to the constructor',
      () {
        const keyword = Keyword.book();

        final keywordChangeNotifier = KeywordChangeNotifier(keyword);

        expect(keywordChangeNotifier.keyword, keyword);
      },
    );

    test(
      'should NOT update the keyword if the new value is null',
      () {
        const keyword = Keyword.book();

        final keywordChangeNotifier = KeywordChangeNotifier(keyword);
        keywordChangeNotifier.keyword = null;

        expect(keywordChangeNotifier.keyword, keyword);
      },
    );

    test(
      'should notify listeners when the keyword has changed',
      () {
        final List<String> log = <String>[];
        void listener1() => log.add('listener1');
        void listener2() => log.add('listener2');

        final keywordChangeNotifier = KeywordChangeNotifier(Keyword.book());
        keywordChangeNotifier.addListener(listener1);
        keywordChangeNotifier.addListener(listener2);

        keywordChangeNotifier.keyword = Keyword.christmas();

        expect(log, <String>['listener1', 'listener2']);
      },
    );

    test(
      'should only notify listeners if the new keyword is different from the previous one and not null',
      () {
        final List<String> log = <String>[];
        void listener1() => log.add('listener1');
        void listener2() => log.add('listener2');

        final keywordChangeNotifier = KeywordChangeNotifier(Keyword.book());
        keywordChangeNotifier.addListener(listener1);
        keywordChangeNotifier.addListener(listener2);

        keywordChangeNotifier.keyword = Keyword.book();

        expect(log, <String>[]);

        keywordChangeNotifier.keyword = null;

        expect(log, <String>[]);
      },
    );
  });
}
