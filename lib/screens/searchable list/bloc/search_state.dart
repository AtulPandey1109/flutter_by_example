part of 'search_bloc.dart';

abstract class SearchState extends Equatable{
  final List<Map<String,dynamic>>? users;
  const SearchState({required this.users});

  @override
  List<Object?> get props =>[users];
}

class InitialState extends SearchState{
  const InitialState():super(users: null);
}

class SearchSuccessState extends SearchState{
  final List<Map<String,dynamic>> searchedUsers;
  const SearchSuccessState({required this.searchedUsers}):super(users: searchedUsers);
}

class SearchingState extends SearchState{
  const SearchingState():super(users: null);
}

class SearchErrorState extends SearchState{
  const SearchErrorState():super(users: null);
}