import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/screens/GetX/my_second_page.dart';

class BooksControllers extends GetxController{
  List<dynamic> books = [].obs;
 void getBooks(){
  books.add("Hello");
 }
}


class GetXExample extends StatefulWidget {
  const GetXExample({super.key});

  @override
  State<GetXExample> createState() => _GetXExampleState();
}

class _GetXExampleState extends State<GetXExample> {

  @override
  void initState() {
    Get.put(BooksControllers());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                isSelected: const [true, false],
                borderRadius: BorderRadius.circular(60),
                children: [
                  IconButton(
                    onPressed: () {
                      Get.changeTheme(ThemeData.light());
                    },
                    icon: const Icon(Icons.light_mode),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.changeTheme(ThemeData.dark());
                    },
                    icon: const Icon(Icons.dark_mode),
                  )
                ],
              ),
            )
          ],
        ),
        body: Center(
          child: TextButton(onPressed: (){
            // Get.to(()=>const MySecondPage());
            Get.toNamed('/secondPage',arguments:  DateTime.now());
          }, child: const Text('Go to second page')
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.snackbar("My SnackBar", "Hi this was created by me.");
        }),
      ),
      getPages: [
        GetPage(name: '/', page: ()=>const GetXExample()),
        GetPage(name: '/secondPage', page: ()=> const MySecondPage()),
      ],
    );
  }
}
