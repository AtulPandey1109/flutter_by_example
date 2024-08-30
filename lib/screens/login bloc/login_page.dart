import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_login_app/screens/login%20bloc/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key,});
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),
            ),
      ),
      body: Column(
        children: [
          Text('Is Authenticated: ${context.select((LoginBloc bloc) => bloc.state.isAuthenticated)}'),
          const SizedBox(height: 200,),
          Center(
            child: BlocBuilder<LoginBloc,LoginState>(
              builder: (context,state) {
                if(state.runtimeType == UnAuthenticatedState){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _userNameController,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(
                          width: 300,
                          child: TextButton(onPressed: (){
                            BlocProvider.of<LoginBloc>(context).add(LoginAuthenticationEvent());
                          }, child: const Text("Login"))
                      ),
                    ],
                  );
                }
                else if(state.runtimeType==LoginAuthenticatingState){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if (state.runtimeType == LoginAuthenticatedState){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          width: 300,
                          child: CircleAvatar(
                            radius: 70,
                            child: Icon(Icons.person,size: 70,),
                          )
                      ),
                      SizedBox(
                          width: 300,
                          child: TextButton(onPressed: (){
                                BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                          }, child: const Text("Logout"))
                      ),
                    ],
                  );
                }
                else{
                  return const Center(child:SizedBox(child:Text("404")));
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}
