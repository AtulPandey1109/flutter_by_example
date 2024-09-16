import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/getx%20login/controller/storage.dart';

class Home extends StatelessWidget {
   Home({super.key});
final StorageController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.popUntil(context, (route){
            return route.settings.name=='/';
          });
        }, icon:const Icon(Icons.arrow_back)),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('LoggedIn as ${c.loginBox.read('email')}'),
          TextButton(onPressed: (){
            c.loginBox.remove('email');
            Get.offNamed('/login');
          }, child: const Text('Log out'))
        ],
      )),
    );
  }
}
