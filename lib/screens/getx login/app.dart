import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/getx%20login/controller/storage.dart';
import 'package:my_login_app/screens/getx%20login/middleware.dart';
import 'package:my_login_app/screens/getx%20login/view/home.dart';
import 'package:my_login_app/screens/getx%20login/view/login_form.dart';



class GetXApp extends StatefulWidget {
  const GetXApp({super.key});

  @override
  State<GetXApp> createState() => _GetXAppState();
}

class _GetXAppState extends State<GetXApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalGetStorage.getStorage();
  }
  @override
  Widget build(BuildContext context) {
    StorageController c = Get.put(StorageController());
    return  GetMaterialApp(
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Get.toNamed('/login');
              }, child: const Text('Login'))
            ],
          ),
        ),
      ),

      getPages: [
        GetPage(name: '/',page: ()=>const GetXApp()),
        GetPage(name: '/login',page: ()=>const LoginForm(),
        middlewares: [MyMiddleware()]
        ),
        GetPage(name: '/home',page: ()=> Home()),
      ],
    );
  }
}
