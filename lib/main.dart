import 'package:bee/firebase_options.dart';
import 'package:bee/screen/phone_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  firebaseInitialize();
}

Future<void> firebaseInitialize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.yellow,
      ),
      home: const LoginPage(
          title: 'Bee Messenger',
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      )
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
              style: loginButtonStyle,
              onPressed: () {
                Navigator.pop(context); //Close this window
                //Open new window by calling Navigator.push()
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhoneSignIn()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Agree and Continue'),
              )
            ),

          ],
          
        ),
        
      ),
      
    );
  } // End of widget
}
