import 'package:flutter/material.dart';
import 'package:my_login_app/model/mydb.dart';

import '../model/dairy.dart';

class MyDairy extends StatefulWidget {
  const MyDairy({super.key});
  @override
  State<MyDairy> createState() => _MyDairyState();
}

class _MyDairyState extends State<MyDairy> {
  Future<List<Dairy>>? pages;
  final db = MyDb();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final TextEditingController _titleUpdateController = TextEditingController();
  final TextEditingController _contentUpdateController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      pages = MyDb().fetchDairies();
    });
  }

  void showContent(Dairy page, BuildContext context) {
    _titleController.text = page.title;
    _contentController.text = page.content;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text(page.title)),
              content: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleUpdateController,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _contentUpdateController,
                      decoration: const InputDecoration(
                        label: Text('Content'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      pages = MyDb().fetchDairies();
                    },
                    icon: const Icon(Icons.thumb_up)),
                IconButton(
                    onPressed: () async {
                      await MyDb().update(
                          id: page.id,
                          title: _titleUpdateController.text,
                          content: _contentUpdateController.text);
                      setState(() {
                        pages = MyDb().fetchDairies();
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await MyDb().deletePage(
                      page.id,
                    );
                    _contentController.clear();
                    _titleController.clear();
                    setState(() {
                      pages = MyDb().fetchDairies();
                    });
                  },
                ),
              ],
            ));
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
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Local Database using SqlLite"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                  maxLines: null,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    label: Text('Content'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () async {
                    await MyDb().add(
                        title: _titleController.text,
                        content: _contentController.text);
                    _contentController.clear();
                    _titleController.clear();
                    setState(() {
                      pages = MyDb().fetchDairies();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: FutureBuilder(
                      future: pages,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final pages = snapshot.data;
                          return pages!.isEmpty
                              ? const Text("No data")
                              : ListView.separated(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final page = pages[index];
                                    return ListTile(
                                        leading: Text('${index + 1}'),
                                        title: Text(page.title),
                                        trailing: Text(page.createdAt),
                                        tileColor: Colors.amberAccent,
                                        onTap: () {
                                          showContent(page, context);
                                        });
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: pages.length,
                                );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
