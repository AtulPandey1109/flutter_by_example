import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<String> abs = ["Atul", "Pandey", "Ramesh", "Suman", "Amit"];

class StreamData {
  final String value;
  StreamData(this.value);
}

class FutureData {
  final String value;
  FutureData(this.value);
}

class MyValue extends ValueNotifier {
  MyValue() : super(0);
  void incrementClick() {
    value++;
  }
}

Stream<StreamData> data() async* {
  for (int i = 0; i < abs.length; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield StreamData(abs[i]);
  }
}

Future<FutureData> futureData() async {
  await Future.delayed(const Duration(seconds: 2));
  return FutureData("Data fetched from Future");
}

class MyValueApp extends StatelessWidget {
  const MyValueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (BuildContext context) => MyValue(),
        ),
        StreamProvider(
            create: (BuildContext context) => data(),
            initialData: StreamData("initialData")),
        FutureProvider(
            create: (BuildContext context) => futureData(),
            initialData: FutureData("Loading...")),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text("Providers"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<MyValue>(builder: (context, notifier, child) {
                  return Text('ValueNotifier example: Count ${notifier.value}');
                }),
                Consumer<StreamData>(builder: (context, data, child) {
                  return Text("StreamProvider example :Stream ${data.value}");
                }),
                Consumer<FutureData>(builder: (context, data, child) {
                  return Text("FutureProvider example :Future ${data.value}");
                }),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<MyValue>(context, listen: false).incrementClick();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
