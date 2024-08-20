import 'package:flutter/material.dart';
class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context,int index){
        return ListTile(
          leading: Text("${index + 1}"),
          title: Text("ListTile Number $index"),
        );
      },
      itemCount: 10,
      ),
    );
  }
}
