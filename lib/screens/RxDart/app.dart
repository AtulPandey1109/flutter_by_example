import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

Stream<List<String>> myStrings() async* {
  yield ["Alice", "Bob", "Sam", "John", "Mark", "Peter"];
}

Stream<List<int>> myPrices() async* {
  await Future.delayed(const Duration(seconds: 2));
  yield [1000,500,4005,1401,412,5214];
}

CombineLatestStream combineLatestStream = CombineLatestStream.combine2(myStrings(), myPrices(), (List<String> names, List<int> prices){
  return List.generate(names.length, (int index){
    return {
      'name' :names[index],
      'money': prices[index]
    };
  });
});

class RxDartExample extends StatelessWidget {
  const RxDartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("RxDart Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("My Strings"),
            StreamBuilder(
                stream: combineLatestStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, int index) {
                            var item =snapshot.data![index];
                        return ListTile(
                          title: Text(item['name']),
                          trailing: Text('${item['money']}'),
                        );
                      }),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
