import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_login_app/screens/searchable%20list/model/data.dart';

import '';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  SearchBloc():super(const InitialState()){
    on<SearchInitialEvent>(_onSearchInitialEvent);
    on<SearchingEvent>(_onSearchEvent);
  }

  void _onSearchInitialEvent(SearchInitialEvent event,Emitter<SearchState> emit) async{
    await Future.delayed(const Duration(seconds: 1));
    emit(SearchSuccessState(searchedUsers: Data.users));
  }

  void _onSearchEvent(SearchingEvent event, Emitter<SearchState> emit){
    emit(const SearchingState());
    List<Map<String,dynamic>> users = Data.users;
    if(event.search.isEmpty){
      emit(SearchSuccessState(searchedUsers: users));
    } else {
      Iterable<Map<String, dynamic>> result = users.where((user)=> user['username'].toLowerCase().contains(event.search.toLowerCase()));
      emit(SearchSuccessState(searchedUsers: result.toList()));
    }
  }
}