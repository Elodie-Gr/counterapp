import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: { //Routes pour accéder aux différentes pages
        '/': (context) => MyHomePage(title: "Counter App"),
        '/secondPage': (context) => SecondRoute(title: "Hello"),
      },
    );
  }
}

//classe de la page principale
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //iniialisation du compteur à 0
  int _counter = 0;

  //Ajoute +1 au compteur quand c'est en dessous de 10, sinon affiche la seconde page
  void _incrementCounter() {
    if (_counter > 10) {
      Navigator.pushNamed(context, '/secondPage');
    } else {
      setState(() {
        _counter++;
      });
    }
  }

  //enlève -1 quand on appuie sur le -
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //création du compteur de la première page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Compteur")),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                heroTag: Text("btn 1"),
                onPressed: _decrementCounter,
                child: Icon(Icons.remove, color: Colors.black),
                backgroundColor: Colors.red,
              ),
              Text('$_counter', style: new TextStyle(fontSize: 60.0)),
              FloatingActionButton(
                heroTag: Text("btn 2"),
                onPressed: _incrementCounter,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//classe de la seconde page
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key,required this.title}) : super(key: key);

  final String title;

  //création de la seconde page avec du texte et un bouton retour
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App 2'),
      ),
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Hello World !",style: TextStyle(fontSize: 22)),
                  ElevatedButton(
                    onPressed: () {
                    Navigator.pop(context);
                    },
                    child: const Text('Retour'),
                  ),
                ],
              ),
              ),
            ),
    );
  }
}
