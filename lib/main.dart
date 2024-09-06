import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_login_app/firebase_options.dart';
import 'package:my_login_app/message_service.dart';
import 'package:my_login_app/routes/routes.dart';
import 'package:my_login_app/screens/dio%20/dio_bloc/dio_bloc.dart';
import 'package:my_login_app/screens/login%20bloc/bloc/login_bloc.dart';
import 'package:my_login_app/screens/searchable%20list/bloc/search_bloc.dart';
import 'package:my_login_app/screens/splash_screen.dart';
import 'package:my_login_app/screens/timer_bloc/bloc/timer_bloc.dart';
import 'package:my_login_app/screens/timer_bloc/ticker.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MessagingService().localInit();
  runApp(const ProviderScope(child:  MyApp()));
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
       BlocProvider(create: (context)=>DioBloc(),),
     ],
     child: MaterialApp(
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1b4f72)),
         useMaterial3: true
       ),
       themeMode: ThemeMode.system,
       debugShowCheckedModeBanner: false,
       home: const SplashScreen(),
       initialRoute: '/',
       onGenerateRoute: AppRouter.generateRoute,
     ),
   );
  }
}
