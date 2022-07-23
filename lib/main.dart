import 'package:flutter/material.dart';

import 'view/dynamic_shadow/dynmaic_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: Pages.routes,
    );
  }
}

class Pages {
  static Map<String, Widget Function(BuildContext)> get routes =>
      pages..addAll(examples);
  static final Map<String, Widget Function(BuildContext)> pages = {
    '/': (context) => const App(),
  };
  static final Map<String, Widget Function(BuildContext)> examples = {
    DynamicShadow.routeName: (context) => DynamicShadow(),
  };
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> examples = Pages.examples.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 16 / 10,
          children: List.generate(examples.length, (index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, examples[index]);
              },
              child: Text(
                '$index\n${examples[index]}',
                textAlign: TextAlign.center,
              ),
            );
          }),
        ),
      ),
    );
  }
}
