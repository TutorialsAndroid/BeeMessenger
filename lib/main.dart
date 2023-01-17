import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(
          title: 'Bee Messenger',
      ),
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

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50))
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      
      body: Center(

        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 30
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Agree and Continue'),
              )
            ),

          ],
          
        ),
        
      ),
      
    );
  }
}
