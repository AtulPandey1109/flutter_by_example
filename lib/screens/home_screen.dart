import 'package:flutter/material.dart';
import '../model/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter By Example"),
          backgroundColor: Colors.greenAccent,
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context,int index){
              final topics = Topics.getDetails();
              return ListTile(
                title: ListTile(
                  leading: Text('${index+1}',style: const TextStyle(fontSize: 15),),
                  title: Text(topics[index].title),
                  tileColor: Colors.lightGreenAccent,
                  trailing: IconButton(icon:const Icon(Icons.arrow_forward),onPressed: (){
                    Navigator.pushNamed(context, topics[index].route);
                  },),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return const SizedBox(height: 10,);
            },
            itemCount: Topics.getDetails().length),
      ),
    );
  }
}

