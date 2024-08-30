import 'package:flutter/material.dart';
import '../model/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const TextStyle myTextStyle = TextStyle(
      fontFamily: 'arial', color: Color(0xff2e4053), fontSize: 16
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter By Example", style: TextStyle(fontFamily: 'arial', color: Color(0xffcacfd2), fontSize: 20),),
          backgroundColor: const Color(0xff2980b9)
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context,int index){
              final topics = Topics.getDetails();
              return ListTile(
                title: ListTile(
                  titleTextStyle: myTextStyle,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  leading: Text('${index+1}',style: const TextStyle(fontSize: 15),),
                  title: Text(topics[index].title),
                  tileColor: Color(0xffaed6f1),
                  trailing: IconButton(icon:const Icon(Icons.arrow_forward),onPressed: (){
                    Navigator.pushNamed(context, topics[index].route);
                  },),
                  onTap: (){
              Navigator.pushNamed(context, topics[index].route);
              },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return const SizedBox(height: 5,);
            },
            itemCount: Topics.getDetails().length),
      ),
    );
  }
}

