import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'dio_events.dart';
part 'dio_states.dart';

List<dynamic>? books;
class DioBloc extends Bloc<DioEvents,DioStates>{
  final dio =Dio();
  DioBloc():super(const InitialState()){
    on<InitialEvent>(onInitialEvent);
    on<AddEvent>(onAddEvent);
    on<DeleteEvent>(onDeleteEvent);
    on<UpdateEvent>(onUpdateEvent);
  }


  FutureOr<void> onInitialEvent(InitialEvent event, Emitter<DioStates> emit) async{
    emit(const LoadingState());
    try{
    final res = await dio.get("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books");
    books=res.data['data'];
    emit(LoadedState(books:books!));
    } catch(e){
      emit(const ErrorState(books: null));
    }
  }

  FutureOr<void> onDeleteEvent(DeleteEvent event, Emitter<DioStates> emit) {
    try{
      emit(const LoadingState());
      dio.delete("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books/${event.id}");
      books?.removeAt(event.index);
      emit(LoadedState(books: books!));
    } catch (e) {
      emit(const ErrorState(books: null));
    }
  }

  FutureOr<void> onUpdateEvent(UpdateEvent event, Emitter<DioStates> emit) {
    final book = books?[event.index];
    try{
      Map<String,dynamic> data ={
        'title' : event.title ?? book['title'],
        'author' :event.author??book['author'],
        'publishYear' : event.publishYear??book['publishYear']
      };
      emit(const LoadingState());
      dio.put("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books/${event.id}",data: data);
      books?[event.index]['title']=event.title;
      books?[event.index]['publishYear']=event.publishYear;
      books?[event.index]['author']=event.author;
      emit(LoadedState(books: books!));

    } catch (e){
      emit(const ErrorState(books: null));
    }
  }

  FutureOr<void> onAddEvent(AddEvent event, Emitter<DioStates> emit) async{
    try{
      Map<String,dynamic> data ={
        'title' : event.title,
        'author' :event.author,
        'publishYear' : event.publishYear
      };
      emit(const LoadingState());
      await dio.post("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books/",data: data);
      final res = await dio.get("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books");
      books=res.data['data'];
      emit(LoadedState(books:books!));

    } catch(e){
      emit(const ErrorState(books: null));
    }
  }
}