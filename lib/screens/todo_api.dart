import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class TodoApi extends StatefulWidget {
  const TodoApi({super.key});

  @override
  State<TodoApi> createState() => _TodoApiState();
}

class _TodoApiState extends State<TodoApi> {
  List<dynamic>todoMap=[];
  void getTodos() async{
 Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
setState(() {
 todoMap.addAll(jsonDecode(response.body));
});
  }
  @override
  void initState() {
    super.initState();
    getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar:AppBar(
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
                  trailing: Text('Id'),

                ),
              Expanded(
                child: ListView.separated(
                itemCount: todoMap.length,
                itemBuilder: (BuildContext context, int index){
                  final todo =todoMap[index];
                  return ListTile(
                    leading: todo['completed']==true?IconButton(icon:const Icon(Icons.check),onPressed: (){
                      setState(() {
                        todo['completed']=false;
                      });
                    },
                    hoverColor: Colors.blue,
                    ): IconButton(icon:const Icon(Icons.cancel),onPressed: (){
                      setState(() {
                        todo['completed']=true;
                      });
                    },),
                    title: Text(todo['title'],overflow: TextOverflow.ellipsis,),
                    trailing: Text(todo['id'].toString()),
                  );
                },separatorBuilder:(BuildContext context,int index){
                return const SizedBox(height: 5,);
                        },
                        ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
