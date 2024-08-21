import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentValue = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Slider Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Value: ${_currentValue.round()}',style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 30,),
            Slider(
                value: _currentValue,
                max: 100,
                divisions: 20,
                label: _currentValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
