import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_login_app/screens/dio%20/dio_bloc/dio_bloc.dart';

class DoiExample extends StatefulWidget {
  const DoiExample({super.key});

  @override
  State<DoiExample> createState() => _DoiExampleState();
}

class _DoiExampleState extends State<DoiExample> {
  final TextEditingController _publishYear = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final dio = Dio();
  List<dynamic> data = [];

  Widget myAlertBox(
      {required BuildContext context, Map<String, dynamic>? book, int? index}) {
    final String heading;
    if (book != null) {
      heading = "Update Book";
      _publishYear.text = '${book['publishYear']}';
      _title.text = book['title'];
      _author.text = book['author'];
    } else {
      heading = "Add Book";
      _publishYear.text = " ";
      _title.text = " ";
      _author.text = " ";
    }
    return AlertDialog(
      title: Text(heading),
      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            TextField(
              controller: _publishYear,
              decoration: const InputDecoration(label: Text('Publish Year')),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _author,
              decoration: const InputDecoration(label: Text('Author')),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              if (book != null) {
                BlocProvider.of<DioBloc>(context).add(UpdateEvent(
                    id: book['_id'],
                    index: index!,
                    title: _title.text,
                    publishYear: int.parse(_publishYear.text),
                    author: _author.text));
              } else {
                BlocProvider.of<DioBloc>(context).add(AddEvent(
                    title: _title.text,
                    author: _author.text,
                    publishYear: int.parse(_publishYear.text)));
              }
              Navigator.of(context).pop();
            },
            child: const Text('Done'))
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DioBloc>(context).add(const InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text("DIO example")),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => myAlertBox(context: context));
              },
              icon: const Icon(
                Icons.add,
                size: 30,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<DioBloc, DioStates>(builder: (context, state) {
              if (state.runtimeType == LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.runtimeType == LoadedState) {
                data = state.books!;
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, int index) {
                        final book = data[index];
                        return Card(
                          child: ListTile(
                            leading: Text('${book['publishYear']}'),
                            title: Text(book['title']),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => myAlertBox(
                                                context: context,
                                                index: index,
                                                book: book));
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        BlocProvider.of<DioBloc>(context).add(
                                            DeleteEvent(
                                                id: book['_id'], index: index));
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ),
                            subtitle: Text(book['author']),
                          ),
                        );
                      },
                      separatorBuilder: (context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: data.length),
                );
              } else {
                return const Center(
                  child: Text("Error Occurred"),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
