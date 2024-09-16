import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/getx%20login/controller/storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StorageController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         Get.back();
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('Email')
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder()
              ),
              obscureText: true,
            ),
            ElevatedButton(onPressed: (){
                c.login(_emailController.text);
                Get.toNamed('/home');
            }, child:const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
