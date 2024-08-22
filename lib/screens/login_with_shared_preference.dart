import 'package:flutter/material.dart';
import 'package:my_login_app/screens/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/validator.dart';

class LoginWithSharedPreference extends StatefulWidget {
  const LoginWithSharedPreference({super.key});

  @override
  State<LoginWithSharedPreference> createState() =>
      _LoginWithSharedPreferenceState();
}

class _LoginWithSharedPreferenceState extends State<LoginWithSharedPreference> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool doRemember = false;

  Future<void> addUser() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("UserEmail", _email.text);

  }
  Future<void> addPref() async{
    if(doRemember){
      final pref = await SharedPreferences.getInstance();
      pref.setBool("isSaved", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("My Login App"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Form(
          key: _loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Login Page",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Please enter your name ',
                      label: Text('Email'),
                    ),
                    validator: (value) => Validator.validateEmail(value!),
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  child: TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                      hintText: 'Please enter your email ',
                      label: Text('Password'),
                    ),
                    validator: (value) {
                      return value!.isEmpty ? "Please enter password" : null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    width: 300,
                    child: CheckboxListTile(
                        value: doRemember,
                        onChanged: (value) {
                          setState(() {
                            doRemember = value!;
                          });
                        },
                    title: const Text("remember me"),
                    ),

                ),
                SizedBox(
                  width: 300,
                  child: FloatingActionButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          addUser();
                          addPref();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserScreen()));
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
