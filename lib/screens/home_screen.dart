import 'package:flutter/material.dart';
import 'package:my_login_app/message_service.dart';
import '../model/topics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const TextStyle myTextStyle = TextStyle(
      fontFamily: 'roboto', color: Color(0xff603F26), fontSize: 16
  );
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MessagingService().init(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child:  Text("Flutter By Example", style: TextStyle(fontFamily: 'roboto', color: Color(0xffFFF8E8), fontSize: 20),)),
          backgroundColor: const Color(0xFFff6C4E31)
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (BuildContext context,int index){
                final topics = Topics.getDetails();
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                      titleTextStyle: HomeScreen.myTextStyle,

                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xff6C4E31), // Orange color
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text(topics[index].title),
                      tileColor: Color(0xffFFF8E8),
                      trailing: IconButton(icon:const Icon(Icons.arrow_forward_ios,size: 30,),onPressed: (){
                        Navigator.pushNamed(context, topics[index].route);
                      },),
                      subtitle: const Text("Tap for more detail"),
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
      ),
    );
  }
}

