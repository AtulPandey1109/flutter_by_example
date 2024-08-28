part of 'home_bloc.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final bool? isLoading;
  final int? index;
  final List<Todo> todos;
  HomeLoadedState({required this.todos, this.isLoading,this.index});
}

class DeletingState extends HomeState{}
class HomeErrorState extends HomeState{}

