import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;

  final VoidCallback onPressed;

  const AlreadyHaveAnAccountCheck({
    Key key,
    @required this.login,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account? " : 'Already have an Account? ',
          style: TextStyle(color: Colors.black87),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? 'Sign Up' : 'Login',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
