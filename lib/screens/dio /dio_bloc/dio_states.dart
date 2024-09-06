part of 'dio_bloc.dart';

abstract class DioStates extends Equatable{
  final List<dynamic>? books;
  const DioStates({required this.books});

  @override
  // TODO: implement props
  List<Object?> get props => [books];
}

class InitialState extends DioStates{
  const InitialState():super(books:null);

}

class LoadingState extends DioStates{
  const LoadingState():super(books: null);

}

class LoadedState extends DioStates{
  @override
  final List<dynamic> books;
  const LoadedState({required this.books}):super(books: books);
}

class ErrorState extends DioStates{
  const ErrorState({required super.books});
}

