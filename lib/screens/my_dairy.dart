import 'package:flutter/material.dart';

class MyDairy extends StatefulWidget {
  const MyDairy({super.key});

  @override
  State<MyDairy> createState() => _MyDairyState();
}

class _MyDairyState extends State<MyDairy> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(appBar: AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back)),
      title: const Text("Local Database using SqlLite"),
    ),));
  }
}
