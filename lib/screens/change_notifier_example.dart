import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyDataModel with ChangeNotifier{
  final List<dynamic> _myList = [];
  List<dynamic> get myList => _myList;

  void addToList(List<dynamic> value){
    _myList.addAll(value);
    notifyListeners();
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final MyDataModel dataNotifier = MyDataModel();
  final Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Change Notifier"),
        actions: [
          IconButton(onPressed: () async{
            final res = await dio.download('https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf', '${(await getApplicationDocumentsDirectory()).path}test.pdf');
         print(res.data.runtimeType);
          }, icon: const Icon(Icons.arrow_downward))
        ],
      ),
      body: MyDataBody(dataNotifier: dataNotifier),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        final res= await dio.get("https://book-store-y7uv-6vsha0a5u-atulp1109.vercel.app/books");
        dataNotifier.addToList(res.data['data']);
      } ,child: const Icon(Icons.get_app_outlined),),
    );
  }
}

class MyDataBody extends StatelessWidget{
  const MyDataBody({super.key,required this.dataNotifier});
  final MyDataModel dataNotifier;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("My List"),
        Expanded(
          child: ListenableBuilder(listenable: dataNotifier, builder: (context, Widget? child){
            final values = dataNotifier.myList;
            return ListView.builder(
              itemCount: values.length,
                itemBuilder: (context,int index){
                final data = values[index];
              return ListTile(
                title: Text(data['title']),
              );
            }
          
            );
          }),
        ),
      ],
    );
  }

}
