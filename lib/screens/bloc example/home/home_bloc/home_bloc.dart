import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_login_app/screens/bloc%20example/home/todo.dart';

import '../data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<AddButtonEvent>(addButtonEvent);
    on<DeleteButtonEvent>(deleteButtonEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedState(
        todos: Data.todos
            .map((e) => Todo(id: e['id'], title: e['title'], date: e['date']))
            .toList()));
  }

  FutureOr<void> addButtonEvent(AddButtonEvent event, Emitter<HomeState> emit) {
    Data.todos.add(event.todo);
    emit(HomeLoadedState(
        todos: Data.todos
            .map((e) => Todo(id: e['id'], title: e['title'], date: e['date']))
            .toList()));
  }

  FutureOr<void> deleteButtonEvent(
      DeleteButtonEvent event, Emitter<HomeState> emit) {
    Data.todos.removeAt(event.index);
    emit(HomeLoadedState(
        todos: Data.todos
            .map((e) => Todo(id: e['id'], title: e['title'], date: e['date']))
            .toList()));
  }
}
