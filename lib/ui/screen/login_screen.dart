import 'package:aaa_demo/res/string_res.dart';
import 'package:aaa_demo/res/style.dart';
import 'package:aaa_demo/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15),
                child: Text(loginWelcome, style: h1Text,)),
            Text(loginMessage, style: TextStyle(color: Colors.black54),),

            TextField(
              autocorrect: false,
              textInputAction: TextInputAction.go,
              maxLines: 1,
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Login'
              ),
            ),

            TextField(
              autocorrect: false,
              textInputAction: TextInputAction.go,
              maxLines: 1,
              maxLength: 50,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'password'
              ),
            ),

            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: Text('Login'),
                onPressed: () => login(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()
      ),
    );
  }

}