import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  final TextEditingController _content = TextEditingController();
  String text ='';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/content.txt');
  }

  Future<void> readContent() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      setState(() {
        _content.text=contents;
      });
    } catch (e) {
      print('Nothing stored');
    }
  }
  void shareFile() async{
    final path = await _localPath;
    Share.shareXFiles([XFile('$path/content.txt')]);
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    return file.writeAsString(_content.text);
  }

@override
  void initState() {
    super.initState();
    readContent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Local Storage"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _content,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Enter your text here",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black26))),
              ),
            ),
            ElevatedButton(onPressed: (){
              writeContent();
              shareFile();
            }, child: const Text('Submit'),)
          ],
        ),
      ),
    ));
  }
}
