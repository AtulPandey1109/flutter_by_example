import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DoiExample extends StatefulWidget {
  const DoiExample({super.key});

  @override
  State<DoiExample> createState() => _DoiExampleState();
}

class _DoiExampleState extends State<DoiExample> {
  final TextEditingController _publishYear = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final dio =Dio();
  List<dynamic> data =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () async{
              final res = await dio.get("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books");
               setState(() {
                 data =res.data["data"];
               });
            }, child:const Text("Get Books")),
            SizedBox(
              height: 500,
              child: ListView.separated(itemBuilder: (context,int index){
                final book= data[index];
                return ListTile(
                  leading: Text('${book['publishYear']}'),
                  title: Text(book['title']),
                  trailing: Text('${book['author']}'),

                );
              }, separatorBuilder: (context,int index){
                return const SizedBox(height: 10,);
              }, itemCount: data.length),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        Map<String, dynamic> data = {
          "title": "Something i have post",
          "author": "Atul",
          "publishYear": 2024
        };
        final res= await dio.post("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books",data: data);
        print(res);
      }),
    );
  }
}
