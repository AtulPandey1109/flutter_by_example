part of 'dio_bloc.dart';

abstract class DioEvents{
  const DioEvents();
}

class InitialEvent extends DioEvents{
  const InitialEvent();
}

class AddEvent extends DioEvents{
  final String title;
  final String author;
  final int publishYear;
  const AddEvent({required this.title,required this.author,required this.publishYear});
}

class UpdateEvent extends DioEvents{
  final String id;
  String? title;
  String? author;
  int? publishYear;
  int index;
  UpdateEvent({required this.id,this.title,this.author,this.publishYear, required this.index});
}

class DeleteEvent extends DioEvents{
  final String id;
  final int index;
  const DeleteEvent({required this.id,required this.index});
}