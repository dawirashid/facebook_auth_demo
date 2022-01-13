import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FacebookSignIn(),
    );
  }
}

class FacebookSignIn extends StatefulWidget {
  const FacebookSignIn({Key? key}) : super(key: key);

  @override
  _FacebookSignInState createState() => _FacebookSignInState();
}

class _FacebookSignInState extends State<FacebookSignIn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
