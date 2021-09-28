import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Snippets',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(children: const <Widget>[
          MyHelloWorld(someText: "Hello World!"),
          MyGreeting()
        ]));
  }
}

class MyHelloWorld extends StatelessWidget {
  const MyHelloWorld({Key? key, required this.someText}) : super(key: key);

  final String someText;

  @override
  Widget build(BuildContext context) => Text(someText);
}

class MyGreeting extends StatefulWidget {
  const MyGreeting({Key? key}) : super(key: key);

  @override
  State<MyGreeting> createState() => _MyGreetingState();
}

class _MyGreetingState extends State<MyGreeting> {
  var names = ["Amir", "Bob", "Carol", "Demeter", "Erebos", "Felix"];
  String _greeting ="No greeting yet :(";

  void _greetSomeone() {
    setState(() {
      _greeting = "Hello ${names.randomItem()}!";
    });
  }

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        Text(_greeting),
        TextButton(child: const Text("say hello"), onPressed: _greetSomeone)
      ]);
}

extension RandomListItem<T> on List<T> {
  T randomItem() => (toList()..shuffle()).first;
}