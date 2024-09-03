import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_login_app/screens/retrofit/model/post_model.dart';
import 'package:my_login_app/screens/retrofit/services/api_service.dart';

class RetroFitExample extends StatelessWidget {
  RetroFitExample({super.key});
  final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back)),
        title:const Text("Retrofit Example"),
        actions: [
          IconButton(onPressed: () async{
           final res = await apiService.addPost(PostModel(userId: 1254, id: 2, title: 'Something', body: 'someone'));
           print(res);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: _body()
    );
  }
  FutureBuilder _body(){

    return FutureBuilder(future: apiService.getPosts(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        List<PostModel> posts = snapshot.data!;
        return ListView.builder(itemCount:posts.length,itemBuilder: (context,int index){
          return  Card(
            color: Colors.amberAccent,
            child:Column(
              children: [
                 Text(posts[index].title),
                Text(posts[index].body),
                IconButton(onPressed: (){
                  apiService.deletePost(posts[index].id);
                }, icon: Icon(Icons.delete))
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
