import 'package:disfilm/core/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Import this file in your projects as
/// import 'package:<<path-to-file>>/dependency_squirrel.dart' as ds;

/// Finds the nearest object of type T that has been previously added to
/// the widget tree using any of the Provider's available ways or by using
/// the insert* methods defined in this file.
///
/// !!! It does not listen to any change.
///
/// It is a shortcut to call provider with listen == false.
T find<T>(BuildContext context) {
  assert(context != null);

  return Provider.of<T>(context, listen: false);
}

/// A convenience method to add an object of type T in the widget tree.
/// If T has a dispose method, T should implement the Disposable class.
/// This method automatically calls dispose() if T implements Disposable.
/// The object of type T will be passed to the childBuilder.
/// The use case of this method is for passing arguments to a widget without
/// forcing the widget to rebuild anytime T changes.
///
/// !!! It does not listen to any change.
///
/// If you need to add a ChangeNotifier, use insertNotifier instead.
Widget insert<T>({
  @required ValueBuilder<T> create,
  @required Widget Function(BuildContext context, T value) childBuilder,
  Key key,
}) {
  assert(create != null);
  assert(childBuilder != null);

  return Provider<T>(
    create: (context) {
      final value = create(context);

      if (value is ChangeNotifier) {
        throw 'It seems you are adding a ChangeNotifier in the widget tree. '
            'In order for the widgets to be rebuilt when '
            'ChangeNotifier.notifyListeners() is called, you need to use '
            'the insertNotifier method instead of this one';
      }

      return value;
    },
    dispose: (context, value) {
      if (value != null && value is Disposable) {
        value.dispose();
      }
    },
    child: Builder(
      builder: (context) {
        return childBuilder(context, find<T>(context));
      },
    ),
  );
}

/// Same as the insert method but only used for classes extending ChangeNotifier
Widget insertNotifier<T extends ChangeNotifier>({
  @required ValueBuilder<T> create,
  @required Widget Function(BuildContext context, T value) childBuilder,
  Key key,
}) {
  return ChangeNotifierProvider<T>(
    create: create,
    child: Builder(
      builder: (context) {
        return childBuilder(context, find<T>(context));
      },
    ),
  );
}

///If you want a subtree to be rebuilt anytime the object of type T changes
/// annotate the region with this widget.
Widget listen<T>({
  @required WidgetBuilder builder,
}) {
  return Builder(
    builder: (context) {
      Provider.of<T>(context);
      return builder(context);
    },
  );
}

Widget listen2<T, U>({
  @required WidgetBuilder builder,
}) {
  return Builder(
    builder: (context) {
      Provider.of<T>(context);
      Provider.of<U>(context);
      return builder(context);
    },
  );
}
