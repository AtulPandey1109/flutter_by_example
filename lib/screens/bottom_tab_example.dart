import 'package:flutter/material.dart';

class BottomTabExample extends StatefulWidget {
  const BottomTabExample({super.key});

  @override
  State<BottomTabExample> createState() => _BottomTabExampleState();
}

class _BottomTabExampleState extends State<BottomTabExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text('Bottom Sheet'),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
          ),
          TextButton(

            onPressed: () {
              showModalBottomSheet(context: context, builder: (context){
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Add new Chat")));
              });
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.black87, foregroundColor: Colors.white),
            child: const Text("+ New Chat"),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ]),));
  }
}
