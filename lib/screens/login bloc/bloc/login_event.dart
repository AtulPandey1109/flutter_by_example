part of 'login_bloc.dart';

abstract class LoginEvent{}

class LoginInitialEvent extends LoginEvent{

}
class LoginAuthenticationEvent extends LoginEvent{

}

class LogoutEvent extends LoginEvent{

}