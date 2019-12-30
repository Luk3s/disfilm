import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/core/dependency_squirrel.dart' as ds;
import 'package:disfilm/core/keyword.dart';
import 'package:disfilm/widgets/keywords_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KeywordIndicator extends StatelessWidget {
  const KeywordIndicator({
    @required this.keywordChangeNotifier,
    Key key,
  })  : assert(keywordChangeNotifier != null),
        super(key: key);

  final KeywordChangeNotifier keywordChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return ds.listen<KeywordChangeNotifier>(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: <Widget>[
            AnimatedOpacity(
              opacity: keywordChangeNotifier.keyword == null ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: keywordChangeNotifier.keyword != null,
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.filter, size: 20),
                  onPressed: () => showKeywordsDialog(
                    context: context,
                    keywordChangeNotifier: keywordChangeNotifier,
                  ),
                ),
              ),
            ),
            for (Keyword keyword in Keyword.values)
              AnimatedOpacity(
                opacity: keyword == keywordChangeNotifier.keyword ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(
                  ignoring: keyword != keywordChangeNotifier.keyword,
                  child: IconButton(
                    icon: Icon(Keyword.icons[keyword]),
                    onPressed: () => showKeywordsDialog(
                      context: context,
                      keywordChangeNotifier: keywordChangeNotifier,
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
