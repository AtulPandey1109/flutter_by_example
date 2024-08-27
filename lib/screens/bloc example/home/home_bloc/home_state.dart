part of 'home_bloc.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final List<Todo> todos;
  HomeLoadedState({required this.todos});
}


class HomeErrorState extends HomeState{}

