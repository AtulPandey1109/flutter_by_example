part of 'home_bloc.dart';

abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class DeleteButtonEvent extends HomeEvent{
  final int index;
  DeleteButtonEvent({required this.index});
}

class AddButtonEvent extends HomeEvent{
  final Map<String,dynamic> todo;
  AddButtonEvent({required this.todo});
}


