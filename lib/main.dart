import 'package:flutter/material.dart';
import 'package:rpn_calculator/BLL/calc.dart';

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
  List<num> stack = [];
  List<dynamic> input = [];

  String _displayProperInput() {
    String properlyFormattedInput = "";
    for (var item in input) {
      properlyFormattedInput += item.toString();
    }
    return properlyFormattedInput;
  }

  String _displayProperStack() {
    String stringToBeFormatted = "";
    String properlyFormattedStack = "";

    for (var item in stack) {
      if (stack.isEmpty) {
        stringToBeFormatted = item.toString();
      } else {
        stringToBeFormatted = "$stringToBeFormatted$item, ";
        properlyFormattedStack =
            stringToBeFormatted.substring(0, stringToBeFormatted.length - 2);
      }
    }

    return properlyFormattedStack;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: Text(
                    _displayProperInput(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: Text(
                    _displayProperStack(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.redAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("CLEAR"),
                    child: FittedBox(
                        child: const Text(
                      "AC",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("√"),
                    child: const Text(
                      "√",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("^"),
                    child: const Text(
                      "^",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("÷"),
                    child: const Text(
                      "÷",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("7"),
                    child: const Text(
                      "7",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("8"),
                    child: const Text(
                      "8",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("9"),
                    child: const Text(
                      "9",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("x"),
                    child: const Text(
                      "x",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("4"),
                    child: const Text(
                      "4",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("5"),
                    child: const Text(
                      "5",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("6"),
                    child: const Text(
                      "6",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("-"),
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("1"),
                    child: const Text(
                      "1",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("2"),
                    child: const Text(
                      "2",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("3"),
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("+"),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.redAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("C"),
                    child: const Text(
                      "C",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightBlueAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("0"),
                    child: FittedBox(
                        child: const Text(
                      "0",
                      style: TextStyle(fontSize: 40),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("."),
                    child: FittedBox(
                        child: const Text(
                      ",",
                      style: TextStyle(fontSize: 40),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.lightGreenAccent),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    onPressed: () => onButtonPressed("ENTER"),
                    child: FittedBox(child: const Text("ENTER")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed(String button) {
    switch (button) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
      case '.':
        setState(() {
          input.add(button);
        });
        break;
      case 'x':
        if (stack.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
          setState(() {
            MultiCommand().apply(stack);
          });
        }
        break;
      case '-':
        if (stack.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
          setState(() {
            SubCommand().apply(stack);
          });
        }
        break;
      case '+':
        if (stack.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
          setState(() {
            AddCommand().apply(stack);
          });
        }
        break;
      case '÷':
        if (stack.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
          setState(() {
            DivCommand().apply(stack);
          });
        }
        break;
      case '√':
        if (stack.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
        setState(() {
          SqrtCommand().apply(stack);
        });}
        break;
      case '^':
        if (stack.length < 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not enough items in the stack"),
            ),
          );
        } else {
          setState(() {
            PowCommand().apply(stack);
          });
          break;
        }
      case 'C':
        setState(() {
          if (input.isNotEmpty) {
            input.removeLast();
          }
        });
        break;
      case 'ENTER':
        if (input.isNotEmpty) {
          setState(() {
            stack.add(num.parse(_displayProperInput()));
            input = [];
          });
        }
        break;
      case 'CLEAR':
        setState(() {
          stack = [];
          input = [];
        });
        break;
    }
  }
}
