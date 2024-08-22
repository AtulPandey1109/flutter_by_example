import 'package:flutter/material.dart';

class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key});
  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  ThemeMode theme = ThemeMode.light;
 String _selectedTime = " ";
  void _setThemeMode(bool isLight) {
    setState(() {
      theme=isLight?ThemeMode.light:ThemeMode.dark;
    });
  }

  void showClock() async{
    TimeOfDay pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now()) as TimeOfDay;
    setState(() {
      _selectedTime=pickedTime.format(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: theme==ThemeMode.light?Colors.white:Colors.black26,
      appBar: AppBar(
        title: const Text("Time Picker Example"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Switch(value: theme==ThemeMode.light, onChanged: _setThemeMode)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selected Time:$_selectedTime.",style: TextStyle(color: theme==ThemeMode.light?Colors.green:Colors.white),),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
              showClock();
            }, child: const Text("Select Time"))
          ],
        ),
      ),
    ));
  }
}
