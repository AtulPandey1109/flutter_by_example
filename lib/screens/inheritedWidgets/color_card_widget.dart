import 'package:flutter/material.dart';

import 'color_widget.dart';

class ColorCardWidget extends StatelessWidget {
  const ColorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: ColorWidget.of(context)!.color,
      height: 500,
      width: 500,
    );
  }
}
