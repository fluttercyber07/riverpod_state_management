import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

final counterStateProvider = StateProvider((ref) {
  return 0;
});
final key1 = StateProvider((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    var key = ref.watch(key1);
    return Scaffold(
      body: Center(
        child: Text("value : $value  $key"),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.state).state++;
                ref.read(key1.state).state+=2;
              },
              child: Icon(Icons.add),
            ),
            Expanded(
              child: SizedBox(),
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.state).state--;
                ref.read(key1.state).state --;
              },
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
