import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(const UnAuthenticatedState()){
    on<LoginAuthenticationEvent>(_onAuthenticationEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  void _onAuthenticationEvent(LoginAuthenticationEvent event,Emitter<LoginState> emit) async{
    emit(const LoginAuthenticatingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoginAuthenticatedState());
  }
  void _onLogoutEvent(LogoutEvent event, Emitter<LoginState> emit) async{
    emit(const LoginAuthenticatingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const UnAuthenticatedState());
  }
}