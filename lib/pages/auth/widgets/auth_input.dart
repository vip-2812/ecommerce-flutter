import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String hintText, labelText, errorText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;

  const AuthInput({
    Key key,
    @required this.hintText,
    @required this.labelText,
    @required this.onChanged,
    @required this.validator,
    @required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 48.0,
        right: 48.0,
        top: 32.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          labelStyle: TextStyle(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final String hintText, labelText, errorText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;

  const PasswordInput({
    Key key,
    @required this.hintText,
    @required this.labelText,
    @required this.onChanged,
    @required this.validator,
    @required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 48.0,
        right: 48.0,
        top: 32.0,
      ),
      child: TextFormField(
        key: const Key('loginForm_passwordInput_textField'),
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        obscureText: true,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final String hintText, labelText, errorText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;

  const EmailInput({
    Key key,
    @required this.hintText,
    @required this.labelText,
    @required this.onChanged,
    @required this.validator,
    @required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 48.0,
        right: 48.0,
        top: 32.0,
      ),
      child: TextFormField(
        key: const Key('loginForm_usernameInput_textField'),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          labelStyle: TextStyle(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: .5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
