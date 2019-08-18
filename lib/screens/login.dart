import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_quizapp/services/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    auth.getUser.then((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/topics');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: 150,
            ),
            Text(
              'Login to Start',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            Text(
              'Your Tagline'
            ),
            LoginButton(
              text: 'Login with Google',
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              loginMethod: auth.googleSignIn,
            ),
            LoginButton(
              text: 'Continue as Guest',
              loginMethod: auth.anonymousLogin,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({
    Key key,
    this.icon,
    this.color,
    this.text,
    this.loginMethod,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final Function loginMethod;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
      onPressed: () async {
        var user = await loginMethod();
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/topics');
        }
      },
      icon: Icon(icon, color: Colors.white,),
      label: Expanded(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

