import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SuperCalculator 3000'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<int> _list;

  String get something => "Hey";

  String get somethingElse => "du";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Text(something),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Text(somethingElse),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("1"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("2"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("3"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("÷"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("4"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("5"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("6"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("x"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("7"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("8"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("9"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("-"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(""),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
