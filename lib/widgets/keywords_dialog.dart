import 'package:disfilm/change_notifiers/keyword_change_notifier.dart';
import 'package:disfilm/core/dependency_squirrel.dart' as ds;
import 'package:disfilm/core/keyword.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> showKeywordsDialog({
  @required BuildContext context,
  @required KeywordChangeNotifier keywordChangeNotifier,
}) async {
  assert(context != null);
  assert(keywordChangeNotifier != null);

  return showDialog(
    context: context,
    builder: (context) {
      return ds.listen<KeywordChangeNotifier>(
        builder: (_) {
          return SimpleDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            children: <Widget>[
              _KeywordDialogOption(
                notifier: keywordChangeNotifier,
                isFirst: true,
              ),
              for (Keyword keyword in Keyword.values) ...[
                _KeywordDialogOption(
                  keyword: keyword,
                  notifier: keywordChangeNotifier,
                  isLast: Keyword.values.last == keyword,
                ),
                if (Keyword.values.last != keyword) Divider(height: 0)
              ]
            ],
          );
        },
      );
    },
  );
}

class _KeywordDialogOption extends StatelessWidget {
  const _KeywordDialogOption({
    @required this.notifier,
    this.keyword,
    this.isFirst = false,
    this.isLast = false,
    Key key,
  })  : assert(notifier != null),
        assert(isFirst != null),
        assert(isLast != null),
        super(key: key);

  final Keyword keyword;
  final KeywordChangeNotifier notifier;
  final bool isFirst;
  final bool isLast;

  bool get _isActive => notifier.keyword == keyword;

  @override
  Widget build(BuildContext context) {
    Widget dialogOption = Container(
      color: _isActive
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(4),
      child: ListTile(
        leading: Icon(
          keyword == null ? FontAwesomeIcons.filter : Keyword.icons[keyword],
          color: Colors.white,
        ),
        title: Text(
          keyword == null ? 'Reset' : keyword.description,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: _RoundedCheckBox(
          isSelected: _isActive,
          color: Colors.white,
        ),
      ),
    );

    if (keyword != notifier.keyword) {
      dialogOption = InkWell(
        borderRadius: _borderRadius,
        onTap: () {
          Navigator.of(context).pop();

          if (keyword == null) {
            notifier.clear();
          } else {
            notifier.keyword = keyword;
          }
        },
        child: dialogOption,
      );
    }

    if (_borderRadius != null) {
      dialogOption = ClipRRect(
        borderRadius: _borderRadius,
        child: dialogOption,
      );
    }

    return dialogOption;
  }

  BorderRadius get _borderRadius {
    if (isFirst) {
      return const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      );
    }

    if (isLast) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      );
    }

    return null;
  }
}

class _RoundedCheckBox extends StatelessWidget {
  const _RoundedCheckBox({
    @required this.isSelected,
    this.size = 16,
    this.color = Colors.white,
    Key key,
  })  : assert(isSelected != null),
        assert(size != null),
        assert(color != null),
        super(key: key);

  final bool isSelected;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white30,
            border: Border.all(color: color),
          ),
          width: size,
          height: size,
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: isSelected ? 1 : 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                width: size / 2,
                height: size / 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
