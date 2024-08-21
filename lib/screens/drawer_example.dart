import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Drawer Example"),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Text(selected),
        ),
        drawer: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60,
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DrawerHeader(

                    child: Text("Drawer Menu"),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  selected = "Home";
                  Navigator.pop(context);
                });
              },
              tileColor: Colors.tealAccent,
            ),ListTile(
              title: const Text("Help"),
              onTap: () {
                setState(() {
                  selected = "Help";
                  Navigator.pop(context);
                });
              },
              tileColor: Colors.tealAccent,
            ),ListTile(
              title: const Text("Contact"),
              onTap: () {
                setState(() {
                  selected = "Contact";
                  Navigator.pop(context);
                });
              },
              tileColor: Colors.tealAccent,
            ),ListTile(
              title: const Text("About"),
              onTap: () {
                setState(() {
                  selected = "About";
                  Navigator.pop(context);
                });
              },
              tileColor: Colors.tealAccent,
            ),
          ],
        ),
      ),
    );
  }
}
