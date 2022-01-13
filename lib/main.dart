import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//the link https://pub.dev/packages/flutter_facebook_auth/install

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
  // 1.set up data var
  Map? _userData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Facebook (Logged ' + (_userData == null ? 'Out' : 'In') + ')'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await FacebookAuth.i
                      .login(permissions: ['email', 'public_profile']);
                  if (result.status == LoginStatus.success) {
                    final requestData =
                        await FacebookAuth.i.getUserData(fields: "email,name");
                    setState(() {
                      _userData = requestData;
                    });
                  }
                },
                child: const Text('Log In'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FacebookAuth.i.logOut();
                  setState(() {
                    _userData = null;
                  });
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
