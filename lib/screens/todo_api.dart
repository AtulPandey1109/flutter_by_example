import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TodoApi extends StatefulWidget {
  const TodoApi({super.key});

  @override
  State<TodoApi> createState() => _TodoApiState();
}

class _TodoApiState extends State<TodoApi> {
  List<dynamic> todoMap = [];
  void getTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    setState(() {
      todoMap.addAll(jsonDecode(response.body));
    });
  }

  void addTodo(Map<String, dynamic> data) async {
    Response res = await post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
        body: data);
    debugPrint('${res.statusCode}');
    setState(() {
      todoMap.add(jsonDecode(res.body));
    });
  }

  void deleteTodo(int id) async {
    Response res = await delete(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    debugPrint('${res.statusCode}');
    setState(() {
      todoMap.removeAt(id - 1);
    });
  }

  void updateTodo(bool completed, int id) async {
    Response res = await patch(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
        body: {"completed": '$completed'});
    debugPrint(res.body);

  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              children: [
                const ListTile(
                  leading: Text('Completed'),
                  title: Center(child: Text("Task")),
                ),
                Expanded(
                  child: todoMap.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          itemCount: todoMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            final todo = todoMap[index];
                            return ListTile(
                              leading: todo['completed'] == true
                                  ? IconButton(
                                      icon: const Icon(Icons.check),
                                      onPressed: () {
                                        setState(() {
                                          todo['completed'] = false;
                                        });
                                      },
                                      hoverColor: Colors.blue,
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        updateTodo(
                                            !todo['completed'], todo['id']);
                                        setState(() {
                                          todo['completed'] = true;
                                        });
                                      },
                                    ),
                              title: Text(
                                todo['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteTodo(todo['id']);
                                  },
                                  icon: const Icon(Icons.delete)),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Map<String, dynamic> data = {
              "userId": "10",
              "id": '${todoMap.length + 1}',
              "title": "Something that i created",
              "completed": "true"
            };
            addTodo(data);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
