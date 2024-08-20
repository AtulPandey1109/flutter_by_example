import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_login_app/screens/sliver_list.dart';
import 'package:my_login_app/screens/todo_api.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

enum Gender { male, female }

class _LoginState extends State<Login> {
  Gender? _gender = Gender.male;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  var users = <String, List<String>>{};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My Login App"),
            leading: IconButton(icon:const Icon(Icons.home),onPressed: (){
              Navigator.pop(context);
            },),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  log("hello");
                },
                mouseCursor: SystemMouseCursors.click,
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Login',
              ),
              Tab(
                child: Text("Sign up"),
              )
            ]),
            backgroundColor: Colors.blue,
          ),
          body: TabBarView(children: [
            Form(
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
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your name ',
                          label: Text('Name'),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 300,
                      child: TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your email ',
                          label: Text('Email'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: FloatingActionButton(
                          child: const Text('Submit'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoApi()));
                          }),
                    )
                  ],
                ),
              ),
            ),
            Form(
              key: _registerFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Registration Page",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 300,
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your name ',
                          label: Text('Name'),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 300,
                      child: TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your email ',
                          label: Text('Email'),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 300,
                      child: TextField(
                        controller: _age,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your Age ',
                          label: Text('Age'),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: 300,
                          child: Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: ListTile(
                            leading: Radio<Gender>(
                                value: Gender.male,
                                groupValue: _gender,
                                onChanged: (gender) {
                                  setState(() {
                                    _gender = gender;
                                  });
                                }),
                            title: const Text("male"),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: ListTile(
                            leading: Radio<Gender>(
                                value: Gender.female,
                                groupValue: _gender,
                                onChanged: (gender) {
                                  setState(() {
                                    _gender = gender;
                                  });
                                }),
                            title: const Text("female"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 300,
                      child: TextField(
                        controller: _phoneNumber,
                        decoration: const InputDecoration(
                          hintText: 'Please enter your mobile number ',
                          label: Text('Phone No.'),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 300,
                      child: FloatingActionButton(
                          child: const Text('Submit'),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Center(child: Text("User Info")),
                                content: SizedBox(
                                  height: 250,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: ${_name.text}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                          )),
                                      Text('Email: ${_email.text}',
                                          style: const TextStyle(fontSize: 18)),
                                      Text('Age: ${_age.text}',
                                          style: const TextStyle(fontSize: 18)),
                                      Text('Phone No.: ${_phoneNumber.text}',
                                          style: const TextStyle(fontSize: 18))
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      users[_phoneNumber.text] = [
                                        _name.text,
                                        _email.text,
                                        _gender.toString()
                                      ];
                                      _name.clear();
                                      _age.clear();
                                      _email.clear();
                                      _phoneNumber.clear();
                                      _gender = Gender.male;
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                              barrierDismissible: false,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
