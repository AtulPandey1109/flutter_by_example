import 'package:flutter/material.dart';

class ColorWidget extends InheritedWidget {
  const ColorWidget({
    super.key,
    required this.color,
    required this.onColorChange,
    required super.child,
  });
final Color color;
final Function onColorChange;
  static ColorWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorWidget>();
  }

  @override
  bool updateShouldNotify(ColorWidget oldWidget) {
    return oldWidget.color!=color;
  }
}
