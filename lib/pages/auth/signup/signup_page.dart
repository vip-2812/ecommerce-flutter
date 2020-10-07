import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/pages/auth/signup/bloc/signup_bloc.dart';
import 'package:ecommerce_flutter/pages/auth/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .125),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: BlocProvider(
          create: (BuildContext context) => getIt<SignupBloc>(),
          child: SignupForm()),
    );
  }
}
