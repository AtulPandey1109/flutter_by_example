  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_login_app/screens/bloc%20example/home/home_bloc/home_bloc.dart';

class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {
  final homeBloc = HomeBloc();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (HomeLoadingState):
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));

            case const (HomeLoadedState):
              final todoState = state as HomeLoadedState;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("My Bloc Example"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _titleController,
                                          decoration: const InputDecoration(
                                            label: Text('Title'),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              final Map<String, dynamic> map = {
                                                'id': state.todos.length + 1,
                                                'title': _titleController.text,
                                                'date': DateTime.now()
                                              };
                                              _titleController.clear();
                                              homeBloc.add(
                                                  AddButtonEvent(todo: map));
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.save))
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                body: ListView.builder(
                    itemCount: todoState.todos.length,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        leading: Text(DateFormat.yMEd()
                            .format(todoState.todos[index].date)),
                        title: Text(todoState.todos[index].title),
                        trailing: (state.isLoading == true &&
                                index == state.index)
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: Center(child:  CircularProgressIndicator(strokeWidth: 2.5,)))
                            : IconButton(
                                onPressed: () {
                                  homeBloc.add(DeleteButtonEvent(index: index));
                                },
                                icon: const Icon(Icons.delete)),
                      );
                    }),
              );
            case const (HomeErrorState):
              return const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              );

            default:
              return const SizedBox();
          }
        });
  }
}
