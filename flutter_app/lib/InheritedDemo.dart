import 'package:flutter/cupertino.dart';

class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>();

  final int count;

  CountContainer({
    Key key,
    @required this.count,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;
}
