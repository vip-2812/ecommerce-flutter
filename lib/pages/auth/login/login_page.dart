import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/pages/auth/login/bloc/login_bloc.dart';
import 'package:ecommerce_flutter/pages/auth/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
          create: (BuildContext context) => getIt<LoginBloc>(),
          child: LoginForm()),
    );
  }
}
