import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredPage extends StatefulWidget {
  const StaggeredPage({super.key});

  @override
  State<StaggeredPage> createState() => _StaggeredPageState();
}

class _StaggeredPageState extends State<StaggeredPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'With Max Cross Axis Extent',
            ),
            Tab(
              child: Text("With Cross Axis Count"),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            MasonryGridView.builder(
              gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset('images/pic${index+1}.png'),
                      Text("${'Random dbfdf dfhdf'*(index+1) }"),
                    ],
                  ),
                );
              },),
            MasonryGridView.builder(
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: myCrossAxisCount()),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset('images/pic${index+1}.png'),
                      Text('Random dbfdf dfhdf'*(index+1)),
                    ],
                  ),
                );
              },),
          ],
        ),
      ),
    );
  }
  int myCrossAxisCount(){
    if (MediaQuery.of(context).size.width>1200){
      return 5;
    } else if(MediaQuery.of(context).size.width>900){
      return 4;
    }else if(MediaQuery.of(context).size.width>600){
      return 3;
    }else if(MediaQuery.of(context).size.width>300) {
      return 2;
    } else{
      return 1;
    }
  }
}
