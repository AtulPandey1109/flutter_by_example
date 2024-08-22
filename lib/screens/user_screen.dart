import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String?userEmail ='';

  Future<void> getUserEmail()async{
    final pref = await SharedPreferences.getInstance();
      String? email=pref.getString("UserEmail")??'';
      setState(() {
      userEmail = email;
      });
  }
  Future<void> removeUser()async{
    final pref = await SharedPreferences.getInstance();
    await pref.remove("UserEmail");
    await pref.remove("isSaved");
  }
  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("My Login App"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      actions: [
        IconButton(onPressed: (){
          removeUser();
          Navigator.popUntil(context, (route){
            return route.settings.name=='/';
          });
        }, icon: const Icon(Icons.logout))
      ],
      ),
      body: Center(
        child: Text("Logged in as $userEmail"),
      ),

    ));
  }
}
