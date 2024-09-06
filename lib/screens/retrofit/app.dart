import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_login_app/screens/retrofit/chopper_retrofit/api_service_chopper.dart';
import 'package:my_login_app/screens/retrofit/model/post_model.dart';
import 'package:my_login_app/screens/retrofit/services/api_service.dart';


class RetroFitExample extends StatelessWidget {
  RetroFitExample({super.key});
  final apiService1 = ApiService(Dio(BaseOptions(contentType: 'application/json')));
  final apiService2 = ApiServiceChopper.create();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back)),
          title:const Text("Retrofit Example"),
          actions: [
            IconButton(onPressed: () async{
             await apiService1.addPost(PostModel(userId: 1254, id: 2, title: 'Something', body: 'someone'));
            }, icon: const Icon(Icons.add)),
            IconButton(onPressed: () async{
              await apiService1.updatePost(2, PostModel(userId: 1254, id: 2, title: 'ManyThing', body: 'someone'));
            }, icon: const Icon(Icons.update))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'By Using Retrofit',
            ),
            Tab(
              text: 'By Using Chopper',
            )
          ]),

        ),
        body: TabBarView(children: [
             _body1(apiService1),
             _body2(apiService2),
        ],)
      ),
    );
  }
  FutureBuilder _body1(ApiService apiService){

    return FutureBuilder(future: apiService.getPosts(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        List<PostModel> posts = snapshot.data!;
        return ListView.builder(itemCount:posts.length,itemBuilder: (context,int index){
          return  Card(
            color: Colors.white70,
            child:Column(
              children: [
                 Text(posts[index].title),
                Text(posts[index].body),
                IconButton(onPressed: (){
                  apiService.deletePost(posts[index].id);
                }, icon: const Icon(Icons.delete))
              ],
            )
          );
        });
      } else{
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }

  FutureBuilder _body2(ApiServiceChopper apiService){

    return FutureBuilder(future: apiService.getPost(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        final List<dynamic> posts =snapshot.data!;
        return ListView.builder(itemCount:posts.length,itemBuilder: (context,int index){
          final post =posts[index];
          return  Card(
            color: Colors.white54,
            child:Column(
              children: [
                 Text(post['title']),
                Text(post['body']),
                IconButton(onPressed: (){
                  apiService.deletePost(posts[index].id);
                }, icon: const Icon(Icons.delete))
              ],
            )
          );
        });
      } else{
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
