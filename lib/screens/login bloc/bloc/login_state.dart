part of 'login_bloc.dart';

abstract class LoginState extends Equatable{
  final bool isAuthenticated;
  const LoginState( this.isAuthenticated);
  @override
  List<Object?> get props => [isAuthenticated];
}


class LoginAuthenticatingState extends LoginState{
  const LoginAuthenticatingState():super(false);
}

class LoginAuthenticatedState extends LoginState{
  const LoginAuthenticatedState():super(true);
}

class UnAuthenticatedState extends LoginState{
  const UnAuthenticatedState():super(false);
}