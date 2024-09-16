import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_login_app/screens/searchable%20list/bloc/search_bloc.dart';

class SearchableList extends StatefulWidget {
  const SearchableList({super.key});

  @override
  State<SearchableList> createState() => _SearchableListState();
}

class _SearchableListState extends State<SearchableList> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String,dynamic>> users=[];

  @override
  void initState() {
    super.initState();
   BlocProvider.of<SearchBloc>(context).add(SearchInitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)
        ),
        title:const  Text("Searchable List Using Bloc"),
      ),
          body: Center(
            child: Column(
              children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width*0.9,
                 child: TextField(
                   onChanged: (value) => BlocProvider.of<SearchBloc>(context).add(SearchingEvent(search: value)),
                   controller: _searchController,
                   decoration: const InputDecoration(
                     label: Text("Search"),
                     suffixIcon: Icon(Icons.search)
                   ),
                 ),
               ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: BlocBuilder<SearchBloc,SearchState>(
                      builder: (context,state) {
                        if(state.users==null){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                       else{
                          users = state.users!;
                          if(state.runtimeType==InitialState){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          else if(state.runtimeType==SearchSuccessState){
                            return ListView.separated(
                              itemCount:users.length,
                              itemBuilder: (context,int index){
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: ListTile(
                                    tileColor: Colors.tealAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    leading: Text('${index + 1}'),
                                    title: Text('Name: ${users[index]['username']}'),
                                    subtitle: Text('Age: ${users[index]['age']}'),
                                    trailing: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('Balance: ${users[index]['balance']}'),
                                        Text('Active: ${users[index]['isActive']}')
                                      ],
                                    ),

                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 10,);
                            },
                            );
                          }
                          else{
                            return const Center(
                              child: Text("Not Found"),
                            );
                          }
                        }
                        
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
    ));
  }
}
