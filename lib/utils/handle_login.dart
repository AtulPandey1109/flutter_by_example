import 'package:flutter/material.dart';
import 'package:my_login_app/screens/login_with_shared_preference.dart';
import 'package:my_login_app/screens/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HandleLogIn extends StatefulWidget {
  const HandleLogIn({super.key});
  @override
  State<HandleLogIn> createState() => _HandleLogInState();
}

class _HandleLogInState extends State<HandleLogIn> {
  bool isLoggedIn=false;
  Future<void> getPref() async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
    isLoggedIn=pref.getBool("isSaved")??false;
    });

  }
  @override
  void initState() {
    super.initState();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return isLoggedIn?const UserScreen():const LoginWithSharedPreference();
  }
}
