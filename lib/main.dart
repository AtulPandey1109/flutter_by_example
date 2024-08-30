import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_login_app/routes/routes.dart';
import 'package:my_login_app/screens/home_screen.dart';
import 'package:my_login_app/screens/login%20bloc/bloc/login_bloc.dart';
import 'package:my_login_app/screens/searchable%20list/bloc/search_bloc.dart';
import 'package:my_login_app/screens/timer_bloc/bloc/timer_bloc.dart';
import 'package:my_login_app/screens/timer_bloc/ticker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return  MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>TimerBloc(ticker: const Ticker()),),
       BlocProvider(create: (context)=>LoginBloc(),),
       BlocProvider(create: (context)=>SearchBloc(),),
     ],
     child: MaterialApp(
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1b4f72)),
         useMaterial3: true
       ),
       themeMode: ThemeMode.system,
       debugShowCheckedModeBanner: false,
       home: const HomeScreen(),
       initialRoute: '/',
       onGenerateRoute: AppRouter.generateRoute,
     ),
   );
  }
}
