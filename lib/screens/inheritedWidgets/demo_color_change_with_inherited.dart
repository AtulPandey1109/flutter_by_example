import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'color_card_widget.dart';
import 'color_widget.dart';
class DemoColorChangeWithInherited extends StatefulWidget {
  const DemoColorChangeWithInherited({super.key});

  @override
  State<DemoColorChangeWithInherited> createState() => _DemoColorChangeWithInheritedState();
}

class _DemoColorChangeWithInheritedState extends State<DemoColorChangeWithInherited> {
  Color color = Colors.red;

  void onColorChange(){
    setState(() {
      color=Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ColorWidget(
      color: color,
      onColorChange: onColorChange,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: const Text("Inherited Widget"),
        ),
        body: Center(
          child: Column(
            children: [
              ColorCardWidget(key: UniqueKey()),
              ElevatedButton(
                onPressed: () => onColorChange(),
                child: const Text("Change Color"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
