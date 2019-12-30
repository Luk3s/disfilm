import 'package:disfilm/core/keyword.dart';
import 'package:flutter/foundation.dart';

class KeywordChangeNotifier with ChangeNotifier {
  KeywordChangeNotifier([this._keyword]);

  Keyword _keyword;

  Keyword get keyword => _keyword;

  set keyword(Keyword keyword) {
    if (keyword != null && keyword != _keyword) {
      _keyword = keyword;
      notifyListeners();
    }
  }

  void clear() {
    _keyword = null;
    notifyListeners();
  }
}
