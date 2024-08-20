import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryImage extends StatefulWidget {
  const GalleryImage({super.key});

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: () {
                _pickImage();
              },
              color: Colors.red,
              child: const Text('Pick From Gallery'),
            ),
            const SizedBox(height: 20,),
            selectedImage==null?const Text('pick image'):Image.file(selectedImage!)
          ],
        ),
      ),
    );

  }
  Future _pickImage() async{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage=File(pickedImage!.path);
    });

  }
}

