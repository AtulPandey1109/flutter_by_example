import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/GetX/app.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key});

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    final BooksControllers bookData = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.arguments.toString()),
            Obx(() => SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount:bookData.books.length,
                    itemBuilder: (BuildContext context, int index) {
                  final book= bookData.books[index];
                      return ListTile(
                        title: Text(book),
                      );
                    },
                  ),
            )),
            GetBuilder(
                init: MyName("Atul", 23),
                builder: (controller){
              return GestureDetector(
                  onTap: (){controller.upper();},
                  child: Text(controller.name));
            }),
            const SizedBox(height: 50,),
            GetBuilder(
              id: 'changeableText',
                init: MyName("Atul", 23),
                builder: (controller){
                  return GestureDetector(
                      onTap: (){controller.upper();},
                      child: Text('press ${controller.name}'));
                }),
            GetBuilder(
              id: 'changeableText',
                init: MyName("Atul", 23),
                builder: (controller){
                  return TextField(
                    onChanged: (text){
                      controller.updateText(text);
                    },
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        bookData.getBooks();
      }),
    );
  }
}

class MyName extends GetxController{
  String name;
  int age;
  MyName(this.name,this.age);
  var inputText = ''.obs;
  @override
  void onInit(){
    super.onInit();
    debounce(inputText,(_){ print(inputText);},time:const Duration(seconds: 2) );
  }
  void updateText(String text){
    inputText.value=text;
  }
  void upper(){
    name = name.toUpperCase();
    update(['changeableText']);
  }
}
