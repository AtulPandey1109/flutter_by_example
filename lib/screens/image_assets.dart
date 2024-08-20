import 'package:flutter/material.dart';

class ImageAssets extends StatelessWidget {
  const ImageAssets({super.key});
  final kFont = 24.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: const Text("Image Assets in Grid Example"),
        ),

        body: CustomScrollView(
          slivers:[ SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    // decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red,image: DecorationImage(image: AssetImage('images/pic$index.png'))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.asset(
                        'images/pic${index+1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                  Text(" $index"),
                ],
              );
            },
              childCount: 10
              ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),

                    ),
    ]
        ),


      ),
    );
  }
}
