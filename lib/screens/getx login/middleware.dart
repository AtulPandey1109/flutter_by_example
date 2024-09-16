
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/getx%20login/controller/storage.dart';

class MyMiddleware extends GetMiddleware{

 final StorageController c = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(c.isLoggedIn){
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}