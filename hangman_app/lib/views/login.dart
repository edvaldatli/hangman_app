import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hangman_app/firebase_options.dart';

Future<UserCredential?> signIn(String emailAddress, String password) async {
  UserCredential? credential;
  try {
    credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    // Handle other exceptions
  }

  // credential will be null if an exception occurred
  return credential;
}

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? user;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  String userEmail = '';

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // This function attempts to sign in and updates the state accordingly.
  void attemptSignIn() async {
    try {
      final credential = await signIn(_emailController.text, _passwordController.text);
      if (credential != null) {
        user = credential.user;
        print(user);
          if(user != null){
            setState(() {
              userEmail = user?.email ?? 'No display name';
              _isLoggedIn = true;
              _errorMessage = '';
            });
          }
      } else {
        setState(() {
          _isLoggedIn = false;
          _errorMessage = 'Sign in failed';
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoggedIn = false;
        _errorMessage = e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Login Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(userEmail),
              if (_isLoggedIn)
                Text('Logged in')
              else if (!_isLoggedIn)
                if (_errorMessage.isNotEmpty)
                  Text('Error: $_errorMessage'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'E-Mail'),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true
                    )
                  ]),
              ElevatedButton(onPressed: attemptSignIn, child: Text('Sign in')),
            ],
          ),
        ),
      ),
    );
  }
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginView());
}
