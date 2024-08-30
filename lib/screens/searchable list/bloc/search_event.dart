part of 'search_bloc.dart';

abstract class SearchEvent{}

class SearchInitialEvent extends SearchEvent{}

class SearchingEvent extends SearchEvent{
  final String search;
  SearchingEvent({required this.search});
}

